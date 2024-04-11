import 'package:TShop/features/authentication/screens/login/login.dart';
import 'package:TShop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    //remove native splash screen
    FlutterNativeSplash.remove();
    //redirect to appropriate screen
    screenRedirect();
  }

//Fucntion show relevant sreen
  screenRedirect() async {
    // Local storage
    deviceStorage.writeIfNull("IsFirstTime", true);

    // Check if it''s the first time lauching khong
    deviceStorage.read("IsFisrtTime") != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

//---Email Password sign in

//--Social sign in

//--Logout
}
