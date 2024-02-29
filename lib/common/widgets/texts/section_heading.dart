import 'package:TShop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title, 
    this.buttonTitle = 'Tất cả', 
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Text(
          'Danh mục sản phẩm', 
          style: TextStyle(
            fontSize: 18.0, 
            fontWeight: FontWeight.w600, 
            color: TColors.white), 
          maxLines: 1,
          overflow: TextOverflow.ellipsis),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}