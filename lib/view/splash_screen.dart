import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/routes/app_routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3998), () {
      Get.offNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/sabrina_logo.PNG'),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedTextKit(
            animatedTexts: [
              FlickerAnimatedText(
                'SABRINA',
                textStyle: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
                speed: const Duration(milliseconds: 4000),
              ),
            ],
            totalRepeatCount: 1,
          ),
          AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText(
                'A slice of Delight',
                textStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.mainColor,
                ),
                duration: const Duration(milliseconds: 5000),
              ),
            ],
            totalRepeatCount: 1,
          )
        ],
      ),
    );
  }
}