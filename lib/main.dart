import 'package:firebase_susha/firebase_susha.dart';
import 'package:flutter/material.dart';
import 'package:fypscreensdemo/mapsdemo.dart';
import 'package:fypscreensdemo/profiledemo.dart';
import 'package:fypscreensdemo/profilesavedemo.dart';
//import 'package:fypscreensdemo/imagedetection.dart';
import 'package:fypscreensdemo/registerdemo.dart';
import 'package:fypscreensdemo/reportdemo.dart';

import 'package:fypscreensdemo/constants/routes.dart';
import 'package:fypscreensdemo/splashdemo.dart';
import 'package:fypscreensdemo/verifyemaildemo.dart';

import 'package:fypscreensdemo/firebase_options.dart';

import 'logindemo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.firebase().initialize(DefaultFirebaseOptions.currentPlatform);
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
        AppRoutes.verifyEmail: (context) => const VerifyEmailPage(),
        AppRoutes.report: (context) => const ReportPage(),
        AppRoutes.profilemake: (context) => const ProfilePage(
              address: '',
              fullName: '',
              phoneNumber: '',
            ),
        AppRoutes.profileview: (context) => const ProfileDisplayPage(
              address: '',
              fullName: '',
              phoneNumber: '',
            ),
        AppRoutes.locationmap: (context) => const LocationMapPage(
              dateTime: '',
              location: '',
            ),
      },
      home: const SplashPage(),
    );
  }
}
