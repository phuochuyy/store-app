import 'package:TShop/common/styles/shadows.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:TShop/common/widgets/icons/t_circular_icon.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/common/widgets/texts/product_title_text.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            //Thumbnail, Wishlist button, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //-- Thumbnail Image
                  const TRoundedImage(
                      imageUrl: TImages.product1, applyImageRadius: true),
                  //-- Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  //--Favourite Icon Button
                  const Positioned(
                      right: 0,
                      top: 0,
                      child: TCircularIcon(
                        icon: Icons.favorite,
                        color: Colors.red,
                      )),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),
            //Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TProductTitleText(
                        title: 'Ten san pham', smallSize: true),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        Text(
                          'Brand name',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(width: TSizes.xs),
                        const Icon(
                          Icons.verified,
                          color: TColors.primary,
                          size: TSizes.iconXs,
                        ),
                      ],
                    ),

                    const Spacer(),
                    /// Price Row

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price
                        // Text('\$100',
                        //     overflow: TextOverflow.ellipsis,
                        //     maxLines: 1,
                        //     style: Theme.of(context).textTheme.headlineMedium!),
                        const Padding(
                          padding: EdgeInsets.only(left: TSizes.sm),
                          child: TProductPriceText(price: '35.0'),
                        );
                        /// Add to Cart Button
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
                              child: Icon(Icons.add, color: TColors.white)),
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
