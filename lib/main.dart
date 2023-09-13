import 'package:flutter/material.dart';
//import 'package:fypscreensdemo/imagedetection.dart';
import 'package:fypscreensdemo/registerdemo.dart';
import 'package:fypscreensdemo/reportdemo.dart';
//import 'package:fypscreensdemo/reportdemo.dart';
import 'package:fypscreensdemo/routes.dart';
import 'package:fypscreensdemo/splashdemo.dart';

import 'logindemo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 107, 186, 250),
      ),
      routes: {
        AppRoutes.splash: (context) => const SplashPage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.register: (context) => const RegistrationPage(),
        AppRoutes.report: (context) => const ReportPage(),
      },
      home: const SplashPage(),
    );
  }
}
