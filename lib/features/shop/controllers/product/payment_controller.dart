// lib/features/shop/controllers/payment_controller.dart
import 'package:TShop/features/shop/controllers/product/checkout_controller.dart';
import 'package:TShop/features/shop/controllers/product/order_controller.dart';
import 'package:TShop/features/shop/service/momo_payment.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:TShop/utils/popups/full_screen_loader.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';
import 'package:TShop/features/shop/controllers/cart_controller.dart';

class PaypalPaymentController extends GetxController {
  static PaypalPaymentController get instance => Get.find();

  final ordercontroller = OrderController.instance;
  final cartcontroller = CartController.instance;
  final checkoutController = CheckoutController.instance;
  final momoService = Get.put(MomoService());

  Future<void> payment(double totalAmount) async {
    try {
      final paymentMethod = checkoutController.selectedPaymentMethod.value.name;
      switch (paymentMethod) {
        case 'Paypal':
          processPaypalPayment(totalAmount);
          break;
        case 'Trực tiếp':
          directPayment(totalAmount);
          break;
        case 'Momo':
          momoPayment(totalAmount);
          break;
        case 'Visa':
          visaPayment(totalAmount);
          break;
        default:
          directPayment(totalAmount);
      }
    } catch (e) {
      print(e.toString());
    }
  }

//  Thanh toan truc tiep
  Future<void> directPayment(double totalAmount) async {
    try {
      ordercontroller.processOrder(totalAmount);
    } catch (e) {
      print(e.toString());
    }
  }

// Thanh toan voi momo
  Future<void> momoPayment(double totalAmount) async {
    try {
      final orderId = THelperFunctions.generateOrderId();
      final paymentData =
          await momoService.fetchPaymentData(orderId, totalAmount);
      final resultCode = paymentData['resultCode'];
      if (resultCode == 0) {
        final deeplink = paymentData['deeplink'] as String;
        await momoService.openMoMoApp(deeplink);

        TFullScreenLoader.openLoadingDialog(
            'Đang xử lý thanh toán', TImages.docerAnimation);

        await Future.delayed(const Duration(seconds: 5));
        TFullScreenLoader.stopLoading();
        ordercontroller.processOrder(totalAmount);
      } else {
        TLoaders.errorSnackBar(
            title: "Lỗi!", message: "Hệ thống thanh toán visa tạm bảo trì!");
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Lỗi!", message: "Hệ thống thanh toán Momo tạm bảo trì! ");
    }
  }

// Thanh toán visa
  Future<void> visaPayment(double totalAmount) async {
    try {
      final orderId = THelperFunctions.generateOrderId();

      final paymentData =
          await momoService.fetchPaymentDataVisa(orderId, totalAmount);
      final resultCode = paymentData['resultCode'];
      if (resultCode == 0) {
        final deeplink = paymentData['payUrl'] as String;
        await momoService.openMoMoApp(deeplink);
        TFullScreenLoader.openLoadingDialog(
            'Đang xử lý thanh toán', TImages.docerAnimation);

        await Future.delayed(const Duration(seconds: 5));
        TFullScreenLoader.stopLoading();
        ordercontroller.processOrder(totalAmount);
      } else {
        TLoaders.errorSnackBar(
            title: "Lỗi!", message: "Hệ thống thanh toán visa tạm bảo trì!");
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Lỗi!", message: "Hệ thống thanh toán visa tạm bảo trì!");
    }
  }

// Thanh toan voi paypal
  Future<void> processPaypalPayment(double totalAmount) async {
    try {
      debugPrint('Total amount: $totalAmount');
      //đôi đơn vị tiền tệ
      totalAmount = totalAmount / 23000;
      // bỏ các số thập phân
      totalAmount = double.parse(totalAmount.toStringAsFixed(2));
      debugPrint('Total amount: $totalAmount');
      bool paymentSuccess =
          await Navigator.of(Get.context!).push(MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckout(
          sandboxMode: true,
          clientId:
              "ARV_kgT_1c48JjsqRm-p31X8P8BRVjG0OTT37VernZSEtewUJjH7eRjcxTWfIZN--HDvmDCIXMIYUeCo", // Replace with your client ID
          secretKey:
              "EJHmu168qmyN5MpFEvXOcj8z1ZW062iL0RSUyoCjPnI4b5zoVud8SbOGL43zCzwRA7LKw5BxpGc5dRlX", // Replace with your secret key
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
            TLoaders.errorSnackBar(
                title: 'Payment fail!', message: error.toString());
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
      // debugPrint('Error vl: $e');
      // TLoaders.errorSnackBar(
      //     title: "Lỗi!", message: "Hệ thống thanh toán paypal tạm bảo trì!");
    }
  }
}
