
import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/icons/t_circular_icon.dart';
import 'package:TShop/common/widgets/images/t_rounded_image.dart';
import 'package:TShop/common/widgets/products/cart/add_remove_button.dart';
import 'package:TShop/common/widgets/products/cart/cart_item.dart';
import 'package:TShop/common/widgets/texts/product_price_text.dart';
import 'package:TShop/common/widgets/texts/product_title_text.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
       body: Padding(
         padding: const EdgeInsets.all(TSizes.defaultSpace),
         child: ListView.separated(
           shrinkWrap: true,
           itemCount: 10,
           separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
           itemBuilder: (_, index) => const Column(
             children: [
               TCartItem(),
               SizedBox(height: TSizes.spaceBtwItems),
       
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                       SizedBox(width: 70),
                       TProductQuantityWidthAddRemoveButton(),
                     ],
                   ),
                   //Add Remove Button
                   TProductPriceText(price: '590'),
                 ],
               )
             ],
           ),
         ),
       ),
       bottomNavigationBar: Padding(
         padding: const EdgeInsets.all(TSizes.defaultSpace),
         child: ElevatedButton(onPressed: (){}, child: const Text('Checkout \$590')),
       ),
      );
  }
}


