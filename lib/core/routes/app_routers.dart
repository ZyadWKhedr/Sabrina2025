import 'package:get/get.dart';
import 'package:sabrina2025/core/routes/app_routes.dart';
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
    // GetPage(
    //   name: AppRoutes.register,
    //   page: () => RegisterPage(),
    // ),
  ];
}