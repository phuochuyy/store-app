import 'package:TShop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/features/authentication/shop/controllers/home_controller.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });
  final List<String> banners ;
  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners.map((url) => TRoundedImage(imageUrl: url, applyImageRadius: true,)).toList(),

            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            )
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        Center(
          child: Obx(
              () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length; i++)
                   TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i ? TColors.primary : Colors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}