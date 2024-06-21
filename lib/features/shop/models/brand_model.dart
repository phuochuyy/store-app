
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String image;
  String name;
  int productsCount;
  bool isFeatured;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.productsCount,
      required this.isFeatured});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'productCount': productsCount,
      'isFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'].toString(),
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        productsCount: data['ProductsCount'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
      );
  }

// Map json oriented document snapshot from rb to brandmodel
  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
// Map JSON Record to the Model
      return BrandModel(
        id: document.id.toString(),
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        productsCount: data['ProductsCount'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return BrandModel.empty();
    }
  }

  static BrandModel empty() => BrandModel(
      id: '', image: '', name: '', isFeatured: false, productsCount: 0);
}
