import 'package:TShop/features/personalization/models/user_model.dart';
import 'package:TShop/features/shop/controllers/review_repository.dart';
import 'package:TShop/features/shop/models/review_model.dart'; // Import ReviewModel
import 'package:TShop/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();

  final isLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final reviewRepository = Get.put(ReviewRepository());
  RxList<ReviewModel> allReviews = <ReviewModel>[].obs;
  RxList<UserModel> featureUsers = <UserModel>[].obs;
  RxMap<String, UserModel> userMap = <String, UserModel>{}.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedUsers();
    fetchAllReviewsWithUsers();
  }

  void fetchFeaturedUsers() async {
    try {
      isLoading.value = true;

      final users = await reviewRepository.getAllUsers();
      featureUsers.assignAll(users);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Add review
  Future<void> addReview(String review, String rating) async {
    try {
      isLoading.value = true;

      User? currentUser = FirebaseAuth.instance.currentUser;
        DateTime now = DateTime.now();

      // Định dạng ngày giờ
      String formattedDate = DateFormat('dd MMM, yyyy').format(now);
      String formattedTime = DateFormat('HH:mm:ss').format(now);

      if (currentUser != null) {
        ReviewModel newReview = ReviewModel(
          id: '', // Firestore will auto-generate the ID
          userId: currentUser.uid,
          review: review,
          rating: rating,
          reviewTime: '$formattedDate $formattedTime',
        );

        await reviewRepository.addReview(newReview);
        allReviews.add(newReview); // Add the new review to the list
        TLoaders.successSnackBar(title: 'Thông báo', message: 'Gửi thành công!');
      } else {
        TLoaders.errorSnackBar(title: 'Error', message: 'User not logged in');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch all reviews and corresponding users
  Future<void> fetchAllReviewsWithUsers() async {
    try {
      isLoading.value = true;

      // Fetch all reviews
      final reviews = await reviewRepository.getAllReviews();
      allReviews.assignAll(reviews);

      // Fetch users for the reviews
      final userIds = reviews.map((review) => review.userId).toSet();
      if (userIds.isNotEmpty) {
        final users = await reviewRepository.getUsersByIds(userIds);
        userMap.assignAll(Map.fromIterable(users, key: (user) => user.id, value: (user) => user));
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
