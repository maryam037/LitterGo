import 'package:firebase_susha/firebase_susha.dart';
import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';

import '../../services/errorsnackbar.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const double fem = 1.0;
    const double ffem = 1.0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        backgroundColor: const Color(0xffe8eff1),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.indigo,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.splash);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30 * fem),
                Image.asset(
                  'assets/icon.png',
                  width: 350 * fem,
                  height: 200 * fem,
                ),
                const SizedBox(height: 10 * fem),
                const Text(
                  'REGISTER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.2 * ffem / fem,
                    color: Color(0xff1473b9),
                  ),
                ),
                const SizedBox(height: 20 * fem),
                buildTextFieldWithImage(
                  'assets/user.png',
                  'Username',
                  fem,
                  ffem,
                  usernameController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    // Add any username validation logic here
                    return null;
                  },
                ),
                const SizedBox(height: 20 * fem),
                buildTextFieldWithImage(
                  'assets/mail.png',
                  'Email',
                  fem,
                  ffem,
                  emailController, // Pass email controller
                  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Check if the email contains the "@" character
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20 * fem),
                buildTextFieldWithImage(
                  'assets/key.png',
                  'Password',
                  fem,
                  ffem,
                  passwordController, // Pass password controller
                  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Check if the password is at least 8 characters long
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 40 * fem),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        // Create the user in Firebase with email, password, and full name
                        var user = await AuthService.firebase().createUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        //TODO: Create User Model Class and User Firestore service class and store username and other data as
                        // await UserFirestoreService().addUser(AppUser(
                        //   id: user.uid,
                        //   email: email,
                        //   name: fullName,
                        //   phoneNumber: '',
                        //   city: '',
                        //   country: '',
                        //   location: null,
                        // ));
                        await AuthService.firebase().sendEmailVerification();
                        await Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.verifyEmail);
                      } on WeakPasswordAuthException {
                        await showErrorSnackbar(
                          context,
                          'Weak Password',
                        );
                      } on EmailAlreadyInUseAuthException {
                        await showErrorSnackbar(
                          context,
                          'Email is already in use',
                        );
                      } on InvalidEmailAuthException {
                        await showErrorSnackbar(
                          context,
                          'Email is invalid',
                        );
                      } on GenericAuthException {
                        await showErrorSnackbar(
                          context,
                          'Registration Error',
                        );
                      }

                      //Navigator.of(context).pushNamed(AppRoutes.login);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10 * fem),
                    decoration: BoxDecoration(
                      color: const Color(0xff4daddf),
                      borderRadius: BorderRadius.circular(20 * fem),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10 * fem),
                        Image.asset(
                          'assets/rightarrow.png',
                          width: 6 * fem,
                          height: 12 * fem,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40 * fem),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(AppRoutes.login);
                  },
                  child: const Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2 * ffem / fem,
                      color: Color(0xff1473b9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextFieldWithImage(
  String imagePath,
  String labelText,
  double fem,
  double ffem,
  TextEditingController controller, // Pass controller
  String? Function(String?) validator, {
  bool obscureText = false,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        width: 23.33 * fem,
        height: 15.33 * fem,
      ),
      SizedBox(width: 10 * fem),
      Expanded(
        child: TextFormField(
          controller: controller, // Use controller to manage input
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Color(0xff4daddf),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4daddf)),
            ),
          ),
          style: TextStyle(
            fontSize: 18 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2 * ffem / fem,
            color: const Color(0xff4daddf),
          ),
          obscureText: obscureText,
          validator: validator,
        ),
      ),
    ],
  );
}
