
import 'package:TShop/features/shop/models/banner_model.dart';
import 'package:TShop/utils/exceptions/firebase_exceptions.dart';
import 'package:TShop/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;
  //get all banners
  Future<List<BannerModel>> fecthAllBanners() async {
    try {
      final banners = await _db.collection('Banners').where('Active',isEqualTo: true).get();
      return banners.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went while fetching Banners!';
    }
  }
  //upload banners to the cloud firebase
}