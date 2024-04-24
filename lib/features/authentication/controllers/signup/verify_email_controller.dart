import 'dart:async';

import 'package:TShop/common/widgets/success_screen/success_screen.dart';
import 'package:TShop/data/repositories/authentication/authentication_repository.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/text_string.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

//Send email Whenever verify Screen appears and set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Đã gửi email',
          message: 'Hãy kiểm tra email của bạn và tiến hành xác thực');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Đã xảy ra lỗi', message: e.toString());
    }
  }

  //Timer to automatically redirect on Email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            tittle: TTexts.yourAccountCreatedTittle,
            subtTittle: TTexts.yourAccountCreatedSubTittle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  //Manually check if email verified
  checkEmailVerificationStatus() async {
    final currenUser = FirebaseAuth.instance.currentUser;
    if (currenUser != null && currenUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImages.successfullyRegisterAnimation,
          tittle: TTexts.yourAccountCreatedTittle,
          subtTittle: TTexts.yourAccountCreatedSubTittle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
