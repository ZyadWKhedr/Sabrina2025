import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabrina2025/core/app/custom_text.dart';
import 'package:sabrina2025/core/constants/app_images.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.logoWithText,
              height: Dimensions.height50 * 5,
              width: Dimensions.width50 * 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'SignUp',
                fontSize: Dimensions.font20 * 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
