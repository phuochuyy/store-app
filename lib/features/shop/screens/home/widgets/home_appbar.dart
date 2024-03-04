import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/product_card/card_menu_icon.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 35.0),
      child:  TAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(TTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
            // Text(TTexts.homeAppBarSubTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white)),
            Text(
              'Xin chào, Tuấn!',
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: TColors.grey,
              ),
            ),
            Text(
              'Trải nghiệm TechnoShop nhé',
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: TColors.white,
              ),
            )
          ],
       ),
        actions: [
          TCartCounterIcon(onPressed: null, iconColor: TColors.white)   
        ],
      ),
    );
  }
}

