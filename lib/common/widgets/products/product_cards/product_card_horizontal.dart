import 'package:TShop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/common/widgets/texts/product_price_text.dart';
import 'package:TShop/common/widgets/texts/product_title_text.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.lightContainer,
      ),
      child: Row(children: [
        ///--thumbnail
        TRoundedContainer(
          height: 120,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: const Stack(
            children: [
              ///--thumbnail i
              SizedBox(
                height: 120,
                width: 120,
                child: TRoundedImage(
                  imageUrl: TImages.product4,
                  applyImageRadius: true,
                ),
              )
            ],
          ),
        ),

        ///--Details
        SizedBox(
          width: 172,
          child: Padding(
            padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(
                      title: "Green Nike Half Sleeves Shirt",
                      smallSize: true,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    // TBrandTitleWithVerifiedIcon(title: "Nike"),
                  ],
                ),

                const Spacer(),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///--Price
                      const Flexible(
                          child: TProductPriceText(price: "256.0")),

                      ///Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(
                                child:
                                    Icon(Iconsax.add, color: TColors.white))),
                      )
                    ])
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
