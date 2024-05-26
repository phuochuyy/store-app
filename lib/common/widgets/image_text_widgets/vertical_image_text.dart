import 'package:TShop/common/widgets/images/t_circular_image.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.onTap,
  });

  final String image, title;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(children: [
          // Container(
          //   width: 56,
          //   height: 56,
          //   padding: const EdgeInsets.all(TSizes.sm),
          //   decoration: BoxDecoration(
          //       color:
          //       backgroundColor ?? (dark ? TColors.black : TColors.white),
          //       borderRadius: BorderRadius.circular(100)),
          //   child: Center(
          //     // child: Image(image: AssetImage(TImages.facebook), fit: BoxFit.cover, colot: THelperFunctions.isDarkMode(context) ? TColors.light : Tcolors.dark)
          //       child: Image(image: NetworkImage(image), fit: BoxFit.cover)),
          // ),

              // Circular Image
          TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              padding: TSizes.sm * 1.4,
              overlayColor: THelperFunctions.isDarkMode(context)
                  ? TColors.light
                  : TColors.dark,
              width: 55,
              height: 55),
          // Text
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          // Text('Laptop', style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white))
          SizedBox(
            width: 55,
            child: Text(title,
                style: const TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                    color: TColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          )
        ]),
      ),
    );
  }
}
//Padding(
//         padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
//         child: Column(children: [
//           Container(
//             width: 56,
//             height: 56,
//             padding: const EdgeInsets.all(TSizes.sm),
//             decoration: BoxDecoration(
//                 color:
//                     backgroundColor ?? (dark ? TColors.black : TColors.white),
//                 borderRadius: BorderRadius.circular(100)),
//             child: Center(
//                 // child: Image(image: AssetImage(TImages.facebook), fit: BoxFit.cover, colot: THelperFunctions.isDarkMode(context) ? TColors.light : Tcolors.dark)
//                 child: Image(image: NetworkImage(image), fit: BoxFit.cover)),
//           ),
//           // Text
//           const SizedBox(height: TSizes.spaceBtwItems / 2),
//           // Text('Laptop', style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white))
//           SizedBox(
//             width: 55,
//             child: Text(title,
//                 style: const TextStyle(
//                     fontSize: 11.0,
//                     fontWeight: FontWeight.w500,
//                     color: TColors.white),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis),
//           )
//         ]),
//       ),