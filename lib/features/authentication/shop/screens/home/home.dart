import 'package:TShop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/features/authentication/shop/screens/home/widgets/home_appbar.dart';
import 'package:TShop/features/authentication/shop/screens/home/widgets/home_categories.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/constants/text_string.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    // return const Scaffold();
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App bar
                   THomeAppBar(),
                  // Search bar
                   TSearchContainer(text: "Nhập sản phẩm..."),
                   SizedBox(height: TSizes.spaceBtwSections),
                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading_cat
                         TSectionHeading(title: 'Danh mục sản phẩm', showActionButton: false),
                        SizedBox(height: TSizes.spaceBtwItems),
                        // List_Categories
                        THomeCategories()
                      ],
                    )
                  )
                ],
              )
              ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3]),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TProductCardVertical(),
                ],
              ),
            ),
          ],

        ),
      ),
      
    );
  }
}







