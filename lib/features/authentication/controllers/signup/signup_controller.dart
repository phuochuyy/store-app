import 'package:TShop/data/repositories/authentication/authentication_repository.dart';
import 'package:TShop/data/repositories/user/user_repository.dart';
import 'package:TShop/features/authentication/screens/signup/verify_email.dart';
import 'package:TShop/features/personalization/models/user_model.dart';
import 'package:TShop/utils/helpers/network_manager.dart';
import 'package:TShop/utils/popups/full_screen_loader.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variable
  final privacyPolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      //Start loading
      // TFullScreenLoader.openLoadingDialog(
      //     "Đang lấy dữ liệu...", TImages.successfullyRegisterAnimation);
      // !! Dang loi FullLoader

      // Check internet connection (chưa bắt đc)
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Chấp nhận điều khoản sử dụng',
            message: 'Hãy chấp nhận điều khoản của chúng tôi!');
        return;
      }

      //Register user in the firebase authentication and save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save authenticated user datat in firebase  firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove loader
      // TFullScreenLoader.stopLoading();

      //show success screen
      TLoaders.successSnackBar(
          title: 'Chúc mừng',
          message:
              'Đã tạo tài khoản thành công! Hãy xác thực Email để tiếp tục');
      //move to verify email screen
      Get.to(VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //Remove loader
      // TFullScreenLoader.stopLoading();
      //show some generic error to the user
      TLoaders.errorSnackBar(
          title: "Hệ thống đã xảy ra gì đó! ", message: e.toString());
    }
  }
}
