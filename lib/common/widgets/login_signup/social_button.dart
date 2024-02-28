


import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(TImages.google),
              width: TSizes.iconMd,
              height: TSizes.iconMd,
            )),
      ),
      const SizedBox(width: TSizes.spaceBtwItems),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(TImages.facebook),
              width: TSizes.iconMd,
              height: TSizes.iconMd,
            )),
      ),
    ]);
  }
}