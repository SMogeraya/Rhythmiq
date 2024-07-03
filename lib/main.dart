import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soul_tunes/data/repositories/authentication.dart';
import 'package:soul_tunes/firebase_options.dart';
import 'app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  ///Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///--Getx Local Storage
  await GetStorage.init();

  ///--Await splash until other itens load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///--Initialise Firebase and Authentication Repository
  await Firebase.initializeApp(
          name: "soul_tunes", options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const App());
}
