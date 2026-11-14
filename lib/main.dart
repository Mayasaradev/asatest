import 'package:flutter/material.dart';
import 'core/services/first_launch_service.dart';
import 'features/welcome/welcome_screen.dart';
import 'debug_page.dart';
import 'package:asatest/core/widgets/app_botton_nav.dart';
import 'package:asatest/core/theme/app_theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isFirstLaunch = await FirstLaunchService.isFirstLaunch();
  runApp(AsaTestApp(isFirstLaunch: isFirstLaunch));
}

class AsaTestApp extends StatelessWidget {
  final bool isFirstLaunch;
  const AsaTestApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      // home: const DebugPage(),
      home: isFirstLaunch ? const WelcomeScreen() : const MainShell(),      
    );
  }
}
