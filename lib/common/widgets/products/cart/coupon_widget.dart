import 'package:TShop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:TShop/features/shop/controllers/cart_controller.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    required this.amount,
    super.key,
  });
  final double amount;

  @override
  Widget build(BuildContext context) {

    final cartcontroller = CartController.instance;
    final couponController = TextEditingController(text: cartcontroller.couponCode.value);
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.white,
        padding: const EdgeInsets.only(
            top: TSizes.sm,
            bottom: TSizes.sm,
            right: TSizes.sm,
            left: TSizes.md),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: couponController,
                decoration: const InputDecoration(
                  hintText: 'Nhập mã giảm giá của bạn ...',
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),

            // Button
            SizedBox(
                width: 80,
                child: ElevatedButton(
                    onPressed: () {
                       // Copon có thể được áp dụng cho giá trị đơn hàng
                      final dis = cartcontroller.calculateDiscount(couponController.text, amount);
                      cartcontroller.applyDiscount(dis, couponController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: dark
                          ? TColors.white.withOpacity(0.5)
                          : TColors.white.withOpacity(0.8),
                      backgroundColor: TColors.primary.withOpacity(0.9),
                      side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: const Text('Apply'))),
          ],
        ));
  }
}
