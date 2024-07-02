import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/features/shop/controllers/review_controller.dart';
import 'package:TShop/features/shop/models/product_model.dart';
import 'package:TShop/features/shop/screens/cart/cart.dart';
import 'package:TShop/features/shop/screens/products_reviews/product_reviews.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final reviewController = Get.find<ReviewController>();
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1.product image slider
            TProductImageSlider(product: product),

            ///2.product details
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace,
                  top: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share Button
                  const TRatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  TProductMetaData(product: product),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Attributes
                  if (product.productType == 'Variable')
                    TProductAttributes(product: product),
                  if (product.productType == 'Variable')
                    const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => const CartScreen()),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                const Color.fromARGB(
                                    255, 145, 14, 4)), // Thiết lập màu nền
                            overlayColor: WidgetStateProperty.all<Color>(Colors
                                .red
                                .shade200), // Thiết lập màu overlay khi nhấn
                            side: WidgetStateProperty.all<BorderSide>(
                                const BorderSide(
                                    color: Color.fromARGB(255, 137, 13,
                                        4))), // Thiết lập màu viền
                          ),
                          child: const Text('Thanh toán'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(product.description ?? '',
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Xem thêm',
                      trimExpandedText: 'Rút gọn',
                      moreStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800)),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  FutureBuilder<int>(
                    future: Get.find<ReviewController>()
                        .getReviewsCount(product.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TSectionHeading(
                              title:
                                  'Đánh giá(${reviewController.allReviews.length})',
                              onPressed: () {},
                              showActionButton: false,
                            ),
                            IconButton(
                                icon: const Icon(
                                  Iconsax.arrow_right_3,
                                  size: 18,
                                ),
                                onPressed: () =>
                                    Get.to(() => const ProductReviewsScreen())),
                          ],
                        );
                      }
                    },
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
