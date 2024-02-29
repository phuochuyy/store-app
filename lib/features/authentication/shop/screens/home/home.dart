import 'package:TShop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/features/authentication/shop/screens/home/widgets/home_appbar.dart';
import 'package:TShop/features/authentication/shop/screens/home/widgets/home_categories.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    // return const Scaffold();
    return const Scaffold(
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
              )
          ],
        ),
      ),
      
    );
  }
}



class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = TColors.white,
  });

  
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: TColors.textWhite.withOpacity(0.1)
      ),
      child: child,
    );
  }
}