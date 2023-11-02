import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_susha/firebase_susha.dart';
import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('EMAIL VERIFICATION'),
        backgroundColor: const Color(0xff1473b9),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(35),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon.png',
                  width: 350,
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  "We've sent you an email verification. Please open your email to verify your account",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1473b9),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  "If you have not received an email, press the button below",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff1473b9),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await AuthService.firebase().sendEmailVerification();
                  },
                  child: const Text('Send email verification again'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                  },
                  child: const Text('Go back to Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
