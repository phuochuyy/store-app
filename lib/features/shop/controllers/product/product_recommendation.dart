import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductRecommendations extends StatefulWidget {
  final int userId;
  const ProductRecommendations({super.key, required this.userId});

  @override
  _ProductRecommendationsState createState() => _ProductRecommendationsState();
}

class _ProductRecommendationsState extends State<ProductRecommendations> {
  List<Map<String, dynamic>> recommendedProducts = [];

  @override
  void initState() {
    super.initState();
    fetchRecommendations();
  }

  Future<void> fetchRecommendations() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/recommend/${widget.userId}'));

    if (response.statusCode == 200) {
      final productIds = List<int>.from(json.decode(response.body));
      setState(() {
        recommendedProducts = productIds.map((id) {
          return {'productId': id, 'productName': 'Product $id', 'category': 'Category $id', 'price': id * 10.0};
        }).toList();
      });
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recommendedProducts.length,
      itemBuilder: (context, index) {
        final product = recommendedProducts[index];
        return ListTile(
          title: Text('Product ID: ${product['productId']}'),
          subtitle: Text('Name: ${product['productName']} - Category: ${product['category']} - Price: \$${product['price']}'),
        );
      },
    );
  }
}
