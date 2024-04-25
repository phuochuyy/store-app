import 'package:TShop/common/widgets/Loaders/animation_loader.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, //for overlayout dialog
        barrierDismissible:
            false, //dialog cant not be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox(
                      height: 250,
                      // Widget children here
                    ),
                  ),
                  TAnimationLoaderWidget(
                    text: text,
                    animation: animation,
                  )
                ],
              ),
            )));
  }

  ///Stop the current open loading dialog

  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); //close the dialog using the Navigator
  }
}
