import 'package:flutter/material.dart';
import 'package:fypscreensdemo/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Create TextEditingController for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Calculate font factors based on device or screen size
    const double fem = 1.0; // Replace with your fem calculation logic
    const double ffem = 1.0; // Replace with your ffem calculation logic

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        backgroundColor: const Color(0xffe8eff1),
        elevation: 0,
        foregroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.indigo, // Set the color of the arrow icon to dark blue
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Use the arrow back icon
          onPressed: () {
            Navigator.of(context).popAndPushNamed(
                AppRoutes.splash); // Navigate back to the previous screen
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
                  'assets/littergo.png', // Replace with your logo asset path
                  width: 350 * fem, // Set the width of your logo as needed
                  height: 200 * fem, // Set the height of your logo as needed
                ),
                const SizedBox(height: 10 * fem),
                const Text(
                  'LOGIN',
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
                const SizedBox(height: 20 * fem),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2 * ffem / fem,
                      color: Color(0xff1473b9),
                    ),
                  ),
                ),
                const SizedBox(height: 40 * fem),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).popAndPushNamed(AppRoutes
                          .report); // Form is valid, add your login logic here
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
                            'Login',
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
                    // Add navigation to the registration page
                    Navigator.of(context).pushNamed(AppRoutes.register);
                  },
                  child: const Text(
                    'Don’t have an account yet?',
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
}
