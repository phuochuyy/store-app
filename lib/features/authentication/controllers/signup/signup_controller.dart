

import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/helpers/network_manager.dart';
import 'package:TShop/utils/popups/full_screen_loader.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance =>  Get.find();
  ///Variable
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      //Start loading
      TFullScreenLoader.openLoadingDialog("Đang lây lấy dữ liệu...", TImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      //Privacy policy check
      //Register user in the firebase authentication and sace user data in firebase
      //Save authenticated user datat in firebase  firestore
      //show success screen
      //move to verify email screen
    } catch (e) {
      //show some generic error to the user
       TLoaders.errorSnackBar(title: "Hình như có vấn đề! ", message: e.toString());
    } finally {
      //Remove loader
      TFullScreenLoader.stopLoading();
    }
  }
 
  
}