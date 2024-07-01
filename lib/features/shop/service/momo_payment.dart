import 'dart:convert';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class MomoService extends GetxController {
  static MomoService get instance => Get.find();

  // goi api yeu cau thanh toan momo
  Future<Map<String, dynamic>> fetchPaymentData(
      String orderId, double amount) async {
    String amountTemp = amount
        .toString()
        .substring(0, amount.toString().length - 1)
        .replaceAll('.', '');
    final response = await http.post(
      Uri.parse('http://192.168.105.61:5000/payment'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"orderId": orderId, "amount": amountTemp}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load payment data${response.statusCode}');
    }
  }

  // goi api yeu cau thanh toan momo visa
  Future<Map<String, dynamic>> fetchPaymentDataVisa(
      String orderId, double amount) async {
    String amountTemp = amount
        .toString()
        .substring(0, amount.toString().length - 1)
        .replaceAll('.', '');
    final response = await http.post(
      Uri.parse('http://192.168.0.102:5000/paymentWithCC'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"orderId": orderId, "amount": amountTemp}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load payment data${response.statusCode}');
    }
  }

  // Hàm gọi API để kiểm tra trạng thái giao dịch
  Future<Map<String, dynamic>> checkTransactionStatus(String orderId) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.102:5000/momo_ipn'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"orderId": orderId}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to check transaction status: ${response.statusCode}');
    }
  }

  // Mo app momo va tien hanh thanh toan
  Future<void> openMoMoApp(String deeplink) async {
    if (await canLaunchUrl(Uri.parse(deeplink))) {
      await launchUrl(Uri.parse(deeplink));
    } else {
      throw Exception('Could not launch $deeplink');
    }
  }
}
