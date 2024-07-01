import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  String id;
  String userId;
  String userFullName;
  String review;
  String rating;
  String reviewTime;


  ReviewModel({
    required this.id,
    required this.userId,
    required this.userFullName,
    required this.review,
    required this.rating,
    required this.reviewTime,

  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UserId': userId,
      'UserFullName': userFullName,
      'Review': review,
      'Rating': rating,
      'ReviewTime': reviewTime,
    };
  }



  factory ReviewModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ReviewModel.empty();
    return ReviewModel(
      id: data['Id'].toString(),
      userId: data['UserId'] ?? '',
      userFullName: data['UserFullName'] ?? '',
      review: data['Review'] ?? '',
      rating: data['Rating'] ?? '',
      reviewTime: data['ReviewTime'] ?? '',
    );
  }

  factory ReviewModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ReviewModel(
        id: document.id.toString(),
        userId: data['UserId'] ?? '',
        userFullName: data['UserFullName'] ?? '',
        review: data['Review'] ?? '',
        rating: data['Rating'] ?? '',
        reviewTime: data['ReviewTime'] ?? '',
      );
    } else {
      return ReviewModel.empty();
    }
  }



  static ReviewModel empty() => ReviewModel(
      id: '', userId: '', userFullName: '', review: '', rating: '', reviewTime: '');
}
