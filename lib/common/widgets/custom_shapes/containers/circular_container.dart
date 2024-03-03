import "package:flutter/material.dart";
import 'package:TShop/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = TColors.white,
    this.margin,
  });

  
  final double? width;
  final double? height;
  final double? radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        //color: TColors.textWhite.withOpacity(0.1)
        color: backgroundColor,
      ),
      child: child,
    );
  }
}