import 'package:flutter/material.dart';
import 'package:goallook/core/di/di.dart';
import 'package:goallook/presentation/router/app_router.dart';
import 'package:goallook/presentation/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
    );
  }
}
