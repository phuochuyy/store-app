
import 'package:TShop/features/shop/controllers/cart_controller.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {

    final cartcontroller = CartController.instance;
    final subTotal = cartcontroller.totalCartPrice.value;


    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng giá', style: Theme.of(context).textTheme.bodyMedium),
            Text('${cartcontroller.formatPrice(subTotal)}đ', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems /2),

        //Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Phí vận chuyển', style: Theme.of(context).textTheme.bodyMedium),
            Text('${cartcontroller.formatPrice(double.parse(TPricingCalculator.calculateShippingCost(subTotal, 'US')))}đ', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

         const SizedBox(height: TSizes.spaceBtwItems /2),
        //Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Thuế VAT', style: Theme.of(context).textTheme.bodyMedium),
            Text('${cartcontroller.formatPrice(double.parse(TPricingCalculator.calculateTax(subTotal, 'US')))}đ', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems /2),
        Obx(() {
        final discountCode = cartcontroller.couponCode.value;
        final discount = cartcontroller.discount.value;
        return discountCode != "" ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('Giảm giá', style: Theme.of(context).textTheme.bodyMedium),
        Text('- ${cartcontroller.formatPrice(discount)}đ', style: Theme.of(context).textTheme.bodyMedium)
        ],


        ) : const SizedBox.shrink();}),
        const SizedBox(height: TSizes.spaceBtwItems /2),

        //Order Total
        Obx(
          () {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng', style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium),
                  Text('${cartcontroller.formatPrice(
                      TPricingCalculator.calculateTotalPrice(
                          subTotal, cartcontroller.discount.value, 'US'))}đ',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium),
                ],
              );
            }),
      ],
    );
  }
}