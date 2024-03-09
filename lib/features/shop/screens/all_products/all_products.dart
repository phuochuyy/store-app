import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/layouts/grid_layout.dart';
import 'package:TShop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Poppular Products"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Drop down
              DropdownButtonFormField(
                onChanged: (value) {},
                decoration: const InputDecoration(icon: Icon(Iconsax.sort)),
                items: [
                  'Name',
                  'High Price',
                  'Low Price',
                  'Sale',
                  'Newest',
                  'Popularity'
                ]
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              TGridLayout(
                  itemCount: 8,
                  itemBuilder: (_, index) => const TProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
