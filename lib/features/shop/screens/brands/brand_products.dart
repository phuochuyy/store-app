import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/brands/brand_card.dart';
import 'package:TShop/common/widgets/products/sortable/sortable_products.dart';
import 'package:TShop/features/shop/controllers/brand_controller.dart';
import 'package:TShop/features/shop/models/brand_model.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key,required this.brand});

  final BrandModel brand;
  

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  Scaffold(
      appBar: const TAppBar(
        title: Text("Nike"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            ///Brand detail
            TBrandCard(showBorder: true, brand: brand,),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

             FutureBuilder(
               future: controller.getBrandProducts(brandId: brand.id),
               builder: (context, snapshot) {
                 return const TSortableProducts();
               }
             )
          ]),
        ),
      ),
    );
  }
}
