
import 'package:TShop/features/shop/controllers/cart_controller.dart';
import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText(
      {this.currencySign = '\$',
      required this.price,
      this.maxLines = 1,
      this.isLarge = false,
      this.lineThrough = false,
      super.key});

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Text('${controller.formatPrice(double.parse(price.replaceAll('.', '').replaceAll('đ', '').trim()))}đ',
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
