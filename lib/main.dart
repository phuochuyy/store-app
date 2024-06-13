import 'package:TShop/app.dart';
import 'package:flutter/material.dart';
import 'package:TShop/data/repositories/authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

/// -- Entry point of Flutter App
Future<void> main() async {
  /// Widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await splash until other items loads
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// --  Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  /// --- Upload Dummy Data to Firebase
  // final categoryRepo = Get.put(CategoryRepository());
  // try {
  //   await categoryRepo.uploadDummyData(getDummyCategories());
  // } catch (e) {
  //   print('Failed to upload dummy data: $e');
  // }

  // Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
