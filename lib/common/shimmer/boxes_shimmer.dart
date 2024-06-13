import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/custom_shimmer/t_shimmer_effect.dart';
import 'package:flutter/material.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 100)),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(child: TShimmerEffect(width: 150, height: 100)),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(child: TShimmerEffect(width: 150, height: 100)),
     
          ],
        )
      ],
    );
  }
}
