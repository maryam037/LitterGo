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
      appBar: AppBar(
          title: const Text('Verify email'), backgroundColor: Colors.black),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(35),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
              color: Colors.white54, borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/icon.png',
                  width: 350,
                  height: 200,
                ),
                const Text(
                    "We've sent you an email verification. Please open it to verify your account",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                    "If you have not recieved an email, press the button below",
                    style: TextStyle(fontSize: 20)),
                TextButton(
                  onPressed: () async {
                    await AuthService.firebase().sendEmailVerification();
                  },
                  child: const Text('Send email verification'),
                ),
                TextButton(
                  onPressed: (() async {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.login,
                    );
                  }),
                  child: const Text('Back to Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
