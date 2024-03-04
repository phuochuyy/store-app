import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:TShop/common/widgets/product_card/card_menu_icon.dart';
import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCartCounterIcon(
            onPressed: () {}
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white,
              expandedHeight: 440,
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
                      showActionButton: true,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 1.5,
                    ),

                    /// --- Brands GRID
                    // TGridLayout();
                    ///// TRoundContainer()
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
