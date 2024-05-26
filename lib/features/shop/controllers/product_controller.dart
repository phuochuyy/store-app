import 'package:TShop/data/repositories/product/product_repository.dart';
import 'package:TShop/features/shop/models/product_model.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featureProducts = <ProductModel>[].obs;

  @override 
  void onInit(){
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async{
    try{
      //Show loader while loading Products;
      isLoading.value = true;

      // Fetch Products

      //Assign Products
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
}
}