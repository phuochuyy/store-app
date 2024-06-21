import 'package:TShop/data/repositories/product/product_repository.dart';
import 'package:TShop/features/shop/models/product_model.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();
  final RxString selectedSortOption = 'Tên'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  final repository = ProductRepository.instance;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Đã xảy ra lỗi!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Tên':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Giá gốc':
        products.sort((a, b) => a.originalPrice.compareTo(b.originalPrice));
        break;
      case 'Giá khuyến mãi':
        products.sort((a, b) => a.originalPrice.compareTo(b.originalPrice));
        break;
      case 'Mới nhất':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        products.sort((a, b)  {
          if(b.salePrice>0){
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice >0){
            return -1;
          } else {
            return  1;
          }
        });
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }


  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts('Tên');
  }
}
