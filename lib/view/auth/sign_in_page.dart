import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sabrina2025/core/app/custom_button.dart';
import 'package:sabrina2025/core/app/custom_text.dart';
import 'package:sabrina2025/core/app/custom_text_field.dart';
import 'package:sabrina2025/core/constants/app_images.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';
import 'package:sabrina2025/core/routes/app_routes.dart';
import 'package:sabrina2025/view/auth/widgets/or_divider.dart';
import 'package:sabrina2025/view_model/auth_view_model.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  text: 'Sign In',
                  fontSize: Dimensions.font20 * 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomTextField(controller: emailController, label: 'Email'),
            CustomTextField(controller: passwordController, label: 'Password'),
            SizedBox(
              height: Dimensions.height10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Don\'t have an account?'),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Get.offAllNamed(AppRoutes.register);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            CustomButton(
                label: 'Sign In',
                onPressed: () {
                  authViewModel.signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  Get.offNamed(AppRoutes.home);
                }),
            SizedBox(
              height: Dimensions.height20,
            ),
            OrDivider()
          ],
        ),
      ),
    );
  }
}
