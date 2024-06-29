import 'package:TShop/features/shop/controllers/product/checkout_controller.dart';
import 'package:TShop/features/shop/controllers/product/order_controller.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {

  final orderController = Get.put(OrderController());
  final checkoutController = CheckoutController.instance;

  void processPayment(double totalAmount) {
    try{
      orderController.processOrder(totalAmount);
      if(checkoutController.selectedPaymentMethod.value.name == 'Paypal')
      {
        Get.to(() => PaypalCheckout(
        sandboxMode: true,
        clientId: "ARV_kgT_1c48JjsqRm-p31X8P8BRVjG0OTT37VernZSEtewUJjH7eRjcxTWfIZN--HDvmDCIXMIYUeCo", // replace with your client id
        secretKey: "EJHmu168qmyN5MpFEvXOcj8z1ZW062iL0RSUyoCjPnI4b5zoVud8SbOGL43zCzwRA7LKw5BxpGc5dRlX", // replace with your secret key
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
        debugPrint("onSuccess: $params");
        orderController.processOrder(totalAmount);
        },
        onError: (error) {
        debugPrint("onError: $error");
        TLoaders.errorSnackBar(title: 'Fail payment on paypal', message: error.toString());
        },
        onCancel: () {
        debugPrint('cancelled:');
        },
        ));
        }
      else{

      }
  }catch(e){
      debugPrint("Error: $e");
      TLoaders.errorSnackBar(title: 'Fail payment', message: e.toString());
  }
    }
  }
