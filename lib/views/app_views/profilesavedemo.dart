import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';
import 'package:fypscreensdemo/views/app_views/profiledemo.dart';

class ProfileDisplayPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String address;
  final String phoneNumber;
  final File? profileImage;

  const ProfileDisplayPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    const double fem = 1.0;
    const double ffem = 1.0;

    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: const Color(0xff1473b9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.profilemake);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20 * fem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'View User Profile!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: Color(0xff1473b9),
              ),
            ),
            const SizedBox(height: 20 * fem),
            profileImage != null
                ? ClipOval(
                    child: Image.file(
                      profileImage!,
                      width: 175,
                      height: 175,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.person,
                    size: 150,
                  ),
            const SizedBox(height: 40 * fem), // Removed the stray comma here
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20 * fem),
                    Image.asset(
                      'assets/user.png',
                      width: 30 * fem,
                      height: 20 * fem,
                    ),
                    const SizedBox(width: 20 * fem),
                    Text(
                      firstName,
                      style: const TextStyle(
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Color(0xff4daddf),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20 * fem),
                Row(
                  children: [
                    const SizedBox(width: 20 * fem),
                    Image.asset(
                      'assets/user.png',
                      width: 30 * fem,
                      height: 20 * fem,
                    ),
                    const SizedBox(width: 20 * fem),
                    Text(
                      lastName,
                      style: const TextStyle(
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Color(0xff4daddf),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20 * fem),
                Row(
                  children: [
                    const SizedBox(width: 20 * fem),
                    Image.asset(
                      'assets/datetime.png',
                      width: 30 * fem,
                      height: 20 * fem,
                    ),
                    const SizedBox(width: 20 * fem),
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Color(0xff4daddf),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20 * fem),
                Row(
                  children: [
                    const SizedBox(width: 20 * fem),
                    Image.asset(
                      'assets/phone.png',
                      width: 30 * fem,
                      height: 20 * fem,
                    ),
                    const SizedBox(width: 20 * fem),
                    Text(
                      phoneNumber,
                      style: const TextStyle(
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Color(0xff4daddf),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40 * fem),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      firstName: firstName,
                      lastName: lastName,
                      address: address,
                      phoneNumber: phoneNumber,
                      profileImage: profileImage,
                    ),
                  ),
                );
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
                      offset: Offset(0, 4 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: const Text(
                        'Edit Profile Info',
                        style: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
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
            const SizedBox(height: 20 * fem),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.report);
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
                      offset: Offset(0, 4 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
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
            /*ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      fullName: fullName,
                      address: address,
                      phoneNumber: phoneNumber,
                      profileImage: profileImage,
                    ),
                  ),
                );
              },
              child: const Text('Edit Profile'),
            ),*/
          ],
        ),
      ),
    );
  }
}
