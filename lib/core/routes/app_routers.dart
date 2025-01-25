import 'package:get/get.dart';
import 'package:sabrina2025/core/routes/app_routes.dart';
import 'package:sabrina2025/view/auth/sign_in_page.dart';
import 'package:sabrina2025/view/auth/signup_page.dart';
import 'package:sabrina2025/view/home/home_page.dart';
import 'package:sabrina2025/view/splash_screen.dart';

class AppRouters {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => SignupPage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => SignInPage(),
    ),
  ];
}
