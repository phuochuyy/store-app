import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/custom_shimmer/t_shimmer_effect.dart';
import 'package:flutter/material.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                TShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
