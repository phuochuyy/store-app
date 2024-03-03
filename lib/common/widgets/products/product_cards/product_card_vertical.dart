import 'package:TShop/common/styles/shadows.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';

class TProductCardVertical extends StatelessWidget {

  const TProductCardVertical({super.key});
  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration:  BoxDecoration(
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
            child:  Stack(
              children: [
                //-- Thumbnail Image
                TRoundedImage(imageUrl: TImages.banner1),
              ],
            ),

          )
        ],
      )
    );
  }
}

