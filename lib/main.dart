import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:truckapp/Model/Localisation.dart';
import 'package:truckapp/Model/DatabaseHelper.dart';
import 'package:truckapp/Screens/Login/Splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: Locale('en,US'),
        translations: LanguageClass(),
        debugShowCheckedModeBanner: false,
        title: 'Driver app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}
