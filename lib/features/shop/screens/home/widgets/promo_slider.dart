import 'package:TShop/common/shimmer/shimmer.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/features/shop/controllers/banner_controller.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        () {
          //loader
          if (controller.isLoading.value) {
            return const TShimmerEffect(width: double.infinity, height: 190);
          }
          // no data found
          if (controller.banners.isEmpty) {
            return const Center(
              child: Text('No data found!'),
            );
          }
          else{
          for (var baner in controller.banners) {
            print("banner url:${baner.imageUrl}");
          }

            return Column(
              children: [
                CarouselSlider(
                    items: controller.banners
                        .map((banner) => TRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      applyImageRadius: true,
                      padding: const EdgeInsets.all(TSizes.sm),
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    )).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          controller.updateCarousalIndex(index),
                    )),
                const SizedBox(height: TSizes.spaceBtwSections),
                Center(
                  child: Obx(
                        () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          TCircularContainer(
                            width: 20,
                            height: 4,
                            margin: const EdgeInsets.only(right: 10),
                            backgroundColor: controller.carousalCurrentIndex.value == i
                                ? TColors.primary
                                : Colors.grey,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }
    );
  }
}
