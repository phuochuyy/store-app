

import 'package:TShop/data/repositories/product/product_repository.dart';
import 'package:TShop/features/shop/models/product_model.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController{

  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async{
    try {
      if(query==null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
      
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Đã xảy ra lỗi!', message: e.toString());
      return [];
    }
}
}