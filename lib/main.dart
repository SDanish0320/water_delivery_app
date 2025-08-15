import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), 
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaFlow',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, 
      builder: DevicePreview.appBuilder, 
      home: const LoginScreen(),
    );
  }
}
