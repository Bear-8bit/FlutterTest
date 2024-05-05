import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/theme/theme.dart';
import 'package:flutter_store/app/screen/onborading/on_boarding_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Figures Store',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      home: const OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}