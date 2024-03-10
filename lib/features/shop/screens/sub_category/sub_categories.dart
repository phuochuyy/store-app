import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(
          title: Text("Sport shirts"),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          // ignore: unnecessary_const
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Banner
                const TRoundedImage(
                  imageUrl: TImages.banner3,
                  applyImageRadius: true,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///Sub-Categories
                Column(
                  children: [
                    ///--Heading
                    const TSectionHeading(
                      title: "Sports shirts",
                      // onPressed: () {},
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            const TProductCardHorizontal(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: TSizes.spaceBtwItems,),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
