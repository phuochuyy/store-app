import 'package:TShop/features/shop/models/order_model.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderModel order;

  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);
  String formatCurrency(double amount) {
  final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
  return formatter.format(amount);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết hóa đơn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mã hóa đơn: ${order.id}', style: Theme.of(context).textTheme.titleLarge),
            Text('Ngày tạo hóa đơn: ${order.formattedOrderDate}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text('Danh sách sản phẩm:', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: TSizes.spaceBtwItems),
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items[index];
                  return Card(
                    child: ListTile(
                      leading: item.image != null
                          ? Image.network(item.image!)
                          : Image.asset(TImages.appleLogo),// Assuming you have image URLs
                      title: Text('Mã sản phẩm: #${item.productId}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tên sản phẩm: ${item.title}'),
                          Text('Số lượng: ${item.quantity}'),
                          Text('Giá: ${formatCurrency(item.price ?? 0.0)}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text.rich(
              TextSpan(
                text: 'Thành tiền: ',
                style: Theme.of(context).textTheme.titleLarge,
                children: [
                  TextSpan(
                    text: formatCurrency(order.totalAmount),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
