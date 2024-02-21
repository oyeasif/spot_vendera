import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
import 'package:spotappui/res/strings.dart';

import 'View/splash_screen/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Locale _currentLocale = Locale('en_US');

    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (_ , child) {
          return GetMaterialApp(
            translations: Strings(),
            locale: _currentLocale,
            fallbackLocale: Locale('en_US'),
            debugShowCheckedModeBanner: false,
            title: 'App Spot',
            theme: ThemeData(

            ),
            home: SplashScreen(),
          );
        },
    );
  }
}