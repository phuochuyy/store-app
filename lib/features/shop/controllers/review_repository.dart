
import 'package:TShop/features/personalization/models/user_model.dart';
import 'package:TShop/features/shop/models/review_model.dart';
import 'package:TShop/utils/exceptions/firebase_exceptions.dart';
import 'package:TShop/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Repository class for user-related operations.
class ReviewRepository extends GetxController {
  static ReviewRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> addReview(ReviewModel review) async {
    await _db.collection('Reviews').add(review.toJson());
  }
  // Fetch all users
    Future<List<UserModel>> getAllUsers() async {
    try {
      final snapshot = await _db
          .collection('Users')
          .limit(10)
          .get();
      return snapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('$e');
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ReviewModel>> getAllReviews() async {
    final querySnapshot = await _db.collection('Reviews').get();
    return querySnapshot.docs
        .map((doc) => ReviewModel.fromSnapshot(doc))
        .toList();
  }
  
  // get user by id 
  Future<UserModel> getUserById(String uid) async {
    final docSnapshot = await _db.collection('Users').doc(uid).get();
    return UserModel.fromSnapShot(docSnapshot);
  }

  // delete review
  
Future<List<UserModel>> getUsersByIds(Set<String> userIds) async {
  if (userIds.isEmpty) {
    return [];
  }

  try {
    final querySnapshot = await _db
        .collection('Users')
        .where(FieldPath.documentId, whereIn: userIds.toList())
        .get();

    return querySnapshot.docs
        .map((doc) => UserModel.fromSnapShot(doc))
        .toList();
  } catch (e) {
    // Xử lý lỗi nếu có vấn đề trong truy vấn Firestore
    print("Error fetching users by IDs: $e");
    return [];
  }
}
 Future<void> deleteReviewByUserId(String userId) async {
    try {
      // Truy vấn để tìm tài liệu với userId cụ thể
      QuerySnapshot querySnapshot = await _db.collection('Reviews')
        .where('UserId', isEqualTo: userId)
        .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Lấy ID của tài liệu đầu tiên (giả sử chỉ có một tài liệu với userId này)
        String docId = querySnapshot.docs.first.id;

        // Xóa tài liệu dựa trên ID
        await _db.collection('Reviews').doc(docId).delete();
      } else {
        throw Exception('Review not found for userId: $userId');
      }
    } catch (e) {
      throw Exception('Failed to delete review: $e');
    }
  }
}
