import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabrina2025/core/app/custom_button.dart';
import 'package:sabrina2025/core/app/custom_text.dart';
import 'package:sabrina2025/core/app/custom_text_field.dart';
import 'package:sabrina2025/core/constants/app_images.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

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
          CustomTextField(controller: firstNameController, label: 'First Name'),
          CustomTextField(controller: lastNameController, label: 'Last Name'),
          CustomTextField(controller: emailController, label: 'Email'),
          CustomTextField(controller: passwordController, label: 'Password'),
          CustomButton(label: 'asdasd', onPressed: () {})
        ],
      ),
    );
  }
}
