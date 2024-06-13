import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String image;
  String name;
  int productCount;
  bool isFeatured;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.productCount,
      required this.isFeatured});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'productCount': productCount,
      'isFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['id'],
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        productCount: data['productCount'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
// Map JSON Record to the Model
      return BrandModel(
        id: document.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        productCount: data['productCount'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return BrandModel.empty();
    }
  }

  static BrandModel empty() => BrandModel(
      id: '', image: '', name: '', isFeatured: false, productCount: 0);
}
