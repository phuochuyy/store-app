// lib/features/shop/controllers/payment_controller.dart
import 'package:TShop/common/widgets/success_screen/success_screen.dart';
import 'package:TShop/data/repositories/authentication/authentication_repository.dart';
import 'package:TShop/data/repositories/orders/order_repository.dart';
import 'package:TShop/features/personalization/controllers/address_controller.dart';
import 'package:TShop/features/shop/controllers/product/checkout_controller.dart';
import 'package:TShop/features/shop/controllers/product/order_controller.dart';
import 'package:TShop/features/shop/models/order_model.dart';
import 'package:TShop/navigation_menu.dart';
import 'package:TShop/utils/constants/enums.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/helpers/pricing_calculator.dart';
import 'package:TShop/utils/popups/full_screen_loader.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';
import 'package:TShop/features/shop/controllers/cart_controller.dart';
import 'package:TShop/features/shop/models/cart_item_model.dart';

class PaypalPaymentController extends GetxController {
  static PaypalPaymentController get instance => Get.find();


  final ordercontroller = OrderController.instance;
  final cartcontroller = CartController.instance;

  Future<void> processPaypalPayment(double totalAmount) async {
    try {
      bool paymentSuccess = await Navigator.of(Get.context!).push(MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckout(
          sandboxMode: true,
          clientId: "ARV_kgT_1c48JjsqRm-p31X8P8BRVjG0OTT37VernZSEtewUJjH7eRjcxTWfIZN--HDvmDCIXMIYUeCo", // Replace with your client ID
          secretKey: "EJHmu168qmyN5MpFEvXOcj8z1ZW062iL0RSUyoCjPnI4b5zoVud8SbOGL43zCzwRA7LKw5BxpGc5dRlX", // Replace with your secret key
          returnURL: "success.snippetcoder.com",
          cancelURL: "cancel.snippetcoder.com",
          transactions: [
            {
              "amount": {
                "total": totalAmount.toString(),
                "currency": "USD",
              },
              "description": "The payment transaction description.",
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            debugPrint("PayPal Success: $params");
            Navigator.pop(context);
            ordercontroller.processOrder(totalAmount);
          },
          onError: (error) {
            TLoaders.errorSnackBar(title: 'Payment fail!', message: error.toString());
            debugPrint("onError: $error");
            Navigator.pop(context);
            return false;
          },
          onCancel: () {

            debugPrint('cancelled:');
            return false;
          },
        ),
      ));

    } catch (e) {
      // TLoaders.errorSnackBar(title: 'out', message: e.toString());
      debugPrint('Error vl: $e');
      // TODO: Handle exception
    }
  }
}