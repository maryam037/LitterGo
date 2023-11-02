//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_susha/firebase_susha.dart';
import 'package:flutter/material.dart';

import 'package:fypscreensdemo/views/app_views/dashboard.dart';
import 'package:fypscreensdemo/views/app_views/feedback.dart';
import 'package:fypscreensdemo/views/app_views/imagedetection.dart';

import 'package:fypscreensdemo/views/app_views/profiledemo.dart';
import 'package:fypscreensdemo/views/app_views/profilesavedemo.dart';
import 'package:fypscreensdemo/views/app_views/reportmap.dart';
import 'package:fypscreensdemo/views/app_views/tracking.dart';
//import 'package:fypscreensdemo/imagedetection.dart';
import 'package:fypscreensdemo/views/auth_views/registerdemo.dart';
import 'package:fypscreensdemo/views/app_views/reportdemo.dart';

import 'package:fypscreensdemo/constants/routes.dart';
import 'package:fypscreensdemo/views/auth_views/splashdemo.dart';
import 'package:fypscreensdemo/views/auth_views/verifyemaildemo.dart';

import 'package:fypscreensdemo/firebase_options.dart';
import 'views/auth_views/logindemo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.firebase()
      .initialize(DefaultFirebaseOptions.currentPlatform);
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
        AppRoutes.register: (context) => const RegistrationPage(),
        AppRoutes.verifyEmail: (context) => const VerifyEmailPage(),
        AppRoutes.report: (context) => const ReportPage(),
        AppRoutes.reportmap: (context) => const MapPage(),
        AppRoutes.feedback: (context) => const FeedbackPage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.profilemake: (context) => const ProfilePage(
              address: '',
              firstName: '',
              lastName: '',
              phoneNumber: '',
              profileImage: null,
            ),
        AppRoutes.profileview: (context) => const ProfileDisplayPage(
              address: '',
              firstName: '',
              lastName: '',
              phoneNumber: '',
              profileImage: null,
            ),
        AppRoutes.maindashboard: (context) => const MainPage(),
        AppRoutes.tracking: (context) => const TrackingScreen(),
        AppRoutes.imagedetect: (context) => const ImageProcessingWidget(),
      },
      home: const SplashPage(),
    );
  }
}
