import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';
import 'package:sabrina2025/core/routes/app_routes.dart';
import 'package:sabrina2025/services/local_storage_service.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  final LocalStorageService _localStorageService = LocalStorageService();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnLoginState();
  }

  Future<void> _navigateBasedOnLoginState() async {
    // Wait for the splash screen duration
    await Future.delayed(const Duration(milliseconds: 3998));

    // Check login state
    final isLoggedIn = await widget._localStorageService.getLoginState();

    // Navigate based on login state
    if (isLoggedIn) {
      Get.offNamed(AppRoutes.home); // Navigate to HomePage
    } else {
      Get.offNamed(AppRoutes.register); // Navigate to RegisterPage
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo Image
          Center(
            child: Image.asset(
              'assets/sabrina_logo.PNG',
              width: Dimensions.width50 * 20,
              height: Dimensions.height20 * 10,
            ),
          ),
          SizedBox(height: Dimensions.height20),

          // Animated "SABRINA" Text
          AnimatedTextKit(
            animatedTexts: [
              FlickerAnimatedText(
                'SABRINA',
                textStyle: TextStyle(
                  fontSize: Dimensions.font40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
                speed: const Duration(milliseconds: 4000),
              ),
            ],
            totalRepeatCount: 1,
          ),

          // Animated "A Slice of Delight" Text
          AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText(
                'A slice of Delight',
                textStyle: TextStyle(
                  fontSize: Dimensions.font20,
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
