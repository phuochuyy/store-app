import 'package:TShop/features/authentication/screens/login/login.dart';
import 'package:TShop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:TShop/features/authentication/screens/signup/verify_email.dart';
import 'package:TShop/navigation_menu.dart';
import 'package:TShop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:TShop/utils/exceptions/firebase_exceptions.dart';
import 'package:TShop/utils/exceptions/format_exceptions.dart';
import 'package:TShop/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // Local storage
      deviceStorage.writeIfNull("IsFirstTime", true);

      // Check if it''s the first time lauching khong
      deviceStorage.read("IsFisrtTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
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
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Đã xảy ra lỗi. Hãy thử lại sau";
    }
  }

// Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Đã xảy ra lỗi. Hãy thử lại sau";
    }
  }
// Re autheticate user
// Forget password

//--Social sign in
// google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details fromt the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print("Đã xảy ra lỗi. Hãy thử lại sau $e");
      return null;
    }
  }

// facebook

//--Logout
// Valid for any authentication (logout user)
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    }
  }
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
