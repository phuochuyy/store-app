// lib/features/shop/controllers/payment_controller.dart
import 'package:TShop/features/shop/controllers/product/checkout_controller.dart';
import 'package:TShop/features/shop/controllers/product/order_controller.dart';
import 'package:TShop/features/shop/service/momo_payment.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:TShop/utils/popups/full_screen_loader.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
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

        while (true) {
          await Future.delayed(const Duration(seconds: 3));
          final queryData = await momoService.checkTransactionStatus(orderId);
          final resultCodeQuery = queryData['resultCode'].toString();
          final mess = queryData['message'];
          if (resultCodeQuery == '0') {
            TFullScreenLoader.stopLoading();
            ordercontroller.processOrder(totalAmount);
            break;
          } else if (resultCodeQuery == '1000') {
            continue;
          } else {
            TFullScreenLoader.stopLoading();
            TLoaders.errorSnackBar(
                title: "Lỗi thanh toán momo!", message: mess);
            break;
          }
        }
      } else {
        TLoaders.errorSnackBar(
            title: "Lỗi!", message: "Hệ thống thanh toán momo tạm bảo trì!");
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

        while (true) {
          await Future.delayed(const Duration(seconds: 3));
          final queryData = await momoService.checkTransactionStatus(orderId);
          final resultCodeQuery = queryData['resultCode'].toString();
          final mess = queryData['message'];
          if (resultCodeQuery == '0') {
            TFullScreenLoader.stopLoading();
            ordercontroller.processOrder(totalAmount);
            break;
          } else if (resultCodeQuery == '1000') {
            continue;
          } else {
            TFullScreenLoader.stopLoading();
            TLoaders.errorSnackBar(
                title: "Lỗi thanh toán momo!", message: mess);
            break;
          }

          
        }
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
      
      // TODO: Implement PayPal checkout later
      TLoaders.warningSnackBar(
          title: "Tính năng tạm thời không khả dụng!", 
          message: "PayPal checkout đang được cập nhật!");
      
      // bool paymentSuccess = false;
      // PayPal integration code temporarily disabled
      
    } catch (e) {
      debugPrint('Error vl: $e');
      TLoaders.errorSnackBar(
          title: "Lỗi!", message: "Hệ thống thanh toán paypal tạm bảo trì!");
    }
  }
}
