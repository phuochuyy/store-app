import 'package:TShop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:TShop/common/widgets/images/t_circular_image.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({super.key, required this.showBorder, this.onTap});

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          children: [
            ///Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
                image: TImages.deviceIcon,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2,),



            ///Text
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TBrandTitleWithVerifiedIcon(title: "Nike", brandTextSize: TextSizes.large),
                Text(
                  '25 Products',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
