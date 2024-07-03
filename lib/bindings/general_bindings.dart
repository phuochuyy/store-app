import 'package:TShop/data/repositories/orders/order_repository.dart';
import 'package:TShop/features/personalization/controllers/address_controller.dart';
import 'package:TShop/features/shop/controllers/product/checkout_controller.dart';
import 'package:TShop/features/shop/controllers/product/favourites_controller.dart';
import 'package:TShop/features/shop/controllers/product/order_controller.dart';
import 'package:TShop/features/shop/controllers/product/product_controller.dart';
import 'package:TShop/features/shop/controllers/product/variation_controller.dart';
import 'package:TShop/features/shop/controllers/review_controller.dart';
import 'package:TShop/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AddressController());
    Get.put(CheckoutController());
    Get.put(VariationController());
    Get.put(OrderRepository());
    // Get.put(ProductController());
    // Get.put(CartController());
    // Get.put(OrderController());

    Get.put(FavouritesController());

    Get.put(ReviewController());
    Get.put(FavouritesController());

  }
}
