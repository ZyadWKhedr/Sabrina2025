import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/constants/supbase_config.dart';
import 'package:sabrina2025/core/routes/app_routers.dart';
import 'package:sabrina2025/core/routes/app_routes.dart';
import 'package:sabrina2025/services/auth_service.dart';
import 'package:sabrina2025/services/supabase_service.dart';
import 'package:sabrina2025/view_model/product_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => SupabaseService(Supabase.instance.client)),
        Provider(create: (_) => AuthService()),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(
            context.read<SupabaseService>(),
          ),
        ),
      ],
      child: const MyApp(),
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
