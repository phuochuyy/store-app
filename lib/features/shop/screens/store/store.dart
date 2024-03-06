import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/appbar/tabbar.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:TShop/common/widgets/images/t_circular_image.dart';
import 'package:TShop/common/widgets/layouts/grid_layout.dart';
import 'package:TShop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/enums.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        /// --- AppBar
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  pinned: true,
                  floating: true,
                  expandedHeight: 440,
                  automaticallyImplyLeading: false,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// --- Search Bar
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        /// --- Featured Brands
                        TSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),

                        /// --- Brand GRID
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                  onTap: () {},
                                  child: TRoundedContainer(
                                      padding: const EdgeInsets.all(TSizes.sm),
                                      showBorder: true,
                                      backgroundColor: Colors.transparent,
                                      child: Row(
                                        children: [
                                          /// -- Icon
                                          Flexible(
                                              child: TCircularImage(
                                            image: TImages.product1,
                                            backgroundColor: Colors.transparent,
                                            isNetworkImage: false,
                                            overlayColor:
                                                THelperFunctions.isDarkMode(
                                                        context)
                                                    ? TColors.white
                                                    : TColors.black,
                                          )),
                                          const SizedBox(
                                              width: TSizes.spaceBtwItems / 2),

                                          /// -- Text
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const TBrandTitleWithVerifiedIcon(
                                                  title: 'Acer',
                                                  brandTextSize:
                                                      TextSizes.large,
                                                ),
                                                Text('312 products',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium)
                                              ],
                                            ),
                                          )
                                        ],
                                      )));
                            }),
                      ],
                    ),
                  ),

                  /// --- Tabs
                  bottom: Text('a')
                  // Các thuộc tính khác của AppBar...);
                  //  const TTabBar(tabs: [
                  //   Tab(child: Text('Phone')),
                  //   Tab(child: Text('Laptop')),
                  //   Tab(child: Text('Tablet')),
                  //   Tab(child: Text('Accessories')),
                  //   Tab(child: Text('Smartwatch')),
                  // ]),
                  )
            ];
          },

          /// --- Body
          body: Container(),
        ),
      ),
    );
  }
}
