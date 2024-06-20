import 'package:commission_art_app2/detail/controller/detail.controller.dart';
import 'package:commission_art_app2/route/route_name.dart';
import 'package:commission_art_app2/route/route_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:commission_art_app2/search/controller/search_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDjh7MHuz8PUVRekSEHwno_VcEuLHTBbAw",
        authDomain: "commission-art-app.firebaseapp.com",
        projectId: "commission-art-app",
        storageBucket: "commission-art-app.appspot.com",
        messagingSenderId: "57603886563",
        appId: "1:57603886563:web:ebea80677e2396d62c64d6",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());

  Get.lazyPut(() => DetailController());
  Get.lazyPut(() => SearchFeatureController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Commission Art App',
      debugShowCheckedModeBanner: false,
      getPages: RoutePages().routes,
      initialRoute: RouteName.SplashScreen,
    );
  }
}
