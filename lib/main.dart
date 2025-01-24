import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/constants/supbase_config.dart';
import 'package:sabrina2025/core/routes/app_routers.dart';
import 'package:sabrina2025/core/routes/app_routes.dart';
import 'package:sabrina2025/view_model/auth_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppRouters.pages,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
    );
  }
}
