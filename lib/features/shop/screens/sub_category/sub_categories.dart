// import 'package:TShop/common/shimmer/horizontal_product_shimmer.dart';
// import 'package:TShop/common/widgets/appbar/appbar.dart';
// import 'package:TShop/common/widgets/images/t_rounded_image.dart';
// import 'package:TShop/common/widgets/products/product_cards/product_card_horizontal.dart';
// import 'package:TShop/common/widgets/texts/section_heading.dart';
// import 'package:TShop/features/shop/controllers/category_controller.dart';
// import 'package:TShop/features/shop/models/category_model.dart';
// import 'package:TShop/features/shop/screens/all_products/all_products.dart';
// import 'package:TShop/utils/constants/image_string.dart';
// import 'package:TShop/utils/constants/size.dart';
// import 'package:TShop/utils/helpers/cloud_helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SubCategoriesScreen extends StatelessWidget {
//   const SubCategoriesScreen({super.key, required this.category});

//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     final controller = CategoryController.instance;

//     return Scaffold(
//         appBar: TAppBar(
//           title: Text(category.name),
//           showBackArrow: true,
//         ),
//         body: SingleChildScrollView(
//             // ignore: unnecessary_const
//             child: Padding(
//                 padding: const EdgeInsets.all(TSizes.defaultSpace),
//                 child: Column(children: [
//                   ///Banner
//                   const TRoundedImage(
//                     imageUrl: TImages.banner3,
//                     applyImageRadius: true,
//                     width: double.infinity,
//                   ),
//                   const SizedBox(
//                     height: TSizes.spaceBtwSections,
//                   ),

//                   ///Sub-Categories
//                   // FutureBuilder(
//                   //     future: controller.getSubCategories(category.id),
//                   //     builder: (context, snapshot) {
//                   //       /// Handle Loader, No Record, OR Error Message
//                   //       const loader = THorizontalProductShimmer();
//                   //       final widget =
//                   //           TCloudHelperFunctions.checkMultiRecordState(
//                   //               snapshot: snapshot, loader: loader);
//                   //       if (widget != null) return widget;

//                   //       /// Record found.
//                   //       final subCategories = snapshot.data!;
//                   //       return ListView.builder(
//                   //         shrinkWrap: true,
//                   //         itemCount: subCategories.length,
//                   //         physics: const NeverScrollableScrollPhysics(),
//                   //         itemBuilder: (_, index) {
//                   //           final subCategory = subCategories[index];
//                   //           // print(subCategory.id);
//                   // return
//                   FutureBuilder(
//                       future: controller.getCategoryProducts(
//                           categoryId: category.id),
//                       builder: (context, snapshot) {
//                         /// Handle Loader, No Record, OR Error Message
//                         const loader = THorizontalProductShimmer();
//                         final widget =
//                             TCloudHelperFunctions.checkMultiRecordState(
//                                 snapshot: snapshot, loader: loader);
//                         if (widget != null) return widget;

//                         /// Congratulations Record found.
//                         final products = snapshot.data!;
//                         // print(products);
//                         return Column(
//                           children: [
//                             /// Heading
//                             // TSectionHeading(
//                             //   title: subCategory.name,
//                             //   onPressed: () => Get.to(
//                             //     () => AllProducts(
//                             //       title: subCategory.name,
//                             //       futureMethod:
//                             //           controller.getCategoryProducts(
//                             //               categoryId: subCategory.id,
//                             //               limit: -1),
//                             //     ),
//                             //   ),
//                             // ),
//                             // const SizedBox(
//                             //   height: TSizes.spaceBtwItems / 2,
//                             // ),

//                             SizedBox(
//                               height: 120,
//                               // width: 400,
//                               child: ListView.separated(
//                                 itemBuilder: (context, index) =>
//                                     TProductCardHorizontal(
//                                         product: products[index]),
//                                 separatorBuilder: (context, index) =>
//                                     const SizedBox(
//                                   width: TSizes.spaceBtwItems,
//                                 ),
//                                 itemCount: products.length,
//                                 scrollDirection: Axis.horizontal,
//                               ),
//                             ),

//                             const SizedBox(
//                               height: TSizes.spaceBtwSections,
//                             )
//                           ],
//                         );
//                       })
//                 ]))));
//   }
//   // );
// }
// // )
// //               ],
// //             ),
// //           ),
// //         ));
// //   }
// // }

import 'package:TShop/common/shimmer/vertical_product_shimmer.dart';
import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/common/widgets/layouts/grid_layout.dart';
import 'package:TShop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/features/shop/controllers/category_controller.dart';
import 'package:TShop/features/shop/models/category_model.dart';
import 'package:TShop/features/shop/screens/all_products/all_products.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                imageUrl: TImages.banner3,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub-Categories
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  /// Handle Loader, No Record, OR Error Message
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Congratulations Record found.
                  final products = snapshot.data!;
                  return Column(children: [
                    TSectionHeading(
                      title: '${category.name} thịnh hành',
                      onPressed: () => Get.to(
                        AllProducts(
                          title: category.name,
                          futureMethod: controller.getCategoryProducts(
                              categoryId: category.id, limit: -1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TGridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) =>
                            TProductCardVertical(product: products[index])),
                  ]);
                  // Obx(() {
                  //   if (controller.isLoading.value) {
                  //     return const TVerticalProductShimmer();
                  //   }

                  //   if (products.isEmpty) {
                  //     return Center(
                  //       child: Text('Không có sản phẩm nào!',
                  //           style: Theme.of(context).textTheme.bodyMedium),
                  //     );
                  //   }

                  //   return TGridLayout(
                  //     itemCount: products.length,
                  //     itemBuilder: (_, index) => TProductCardVertical(
                  //       product: products[index],
                  //     ),
                  //   );
                  // });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
