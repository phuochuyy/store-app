import 'package:TShop/features/personalization/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save user data to firebase
  Future<void> saveUserRecord(UserModel user) async {
    try {
      _db.collection('User').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
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

  //Fetch user details base on user ID

//Update user data in Firestore
}
