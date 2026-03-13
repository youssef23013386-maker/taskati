import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/core/styles/themes.dart';
import 'package:taskati/features/spalsh/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      home:SplashScreen(),
      builder: (context, child) {
        return  Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.backgroundColor,
        ),
        Image.asset(
          AppImages.backgraound,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        child ?? Container(),
        ] );
      }
    );
  }
}
