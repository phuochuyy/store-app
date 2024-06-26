import 'package:TShop/features/personalization/controllers/address_controller.dart';
import 'package:TShop/features/shop/controllers/product/checkout_controller.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import  '';
class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  ///variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  ///Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: '0h Snap!', message: e.toString());
      return [];
    }
  }

}
