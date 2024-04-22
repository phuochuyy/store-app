import 'package:TShop/features/authentication/screens/login/login.dart';
import 'package:TShop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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
// Sign in
// Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // throw TFirebaseAuthException(e.code).message;
      throw e.toString();
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw e.toString();

    } on FormatException catch (e) {
      // throw TFormatException();
      throw e.toString();

    } on PlatformException catch (e) {
      // throw TPlatformException(e.code).message;
      throw e.toString();

    } catch (e) {
      throw "Đã xảy ra lỗi. Hãy thử lại sau";
    }
  }
// Mail Vertify
// Reautheticate user
// Forget password

//--Social sign in
// google
// facebook

//--Logout
// Valid for any authentication (logout user)
// Remove user auth and firestore account (delete user)
}

// class TPlatformException {
//   final String message;

//   TPlatformException(this.message);
// }

// class TFormatException {}

// class TFirebaseAuthException {
//   final String message;

//   TFirebaseAuthException(this.message);
// }

// class TFirebaseException {
//   final String message;

//   TFirebaseException(this.message);
// }
