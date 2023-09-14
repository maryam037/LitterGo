import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fypscreensdemo/profiledemo.dart';

class ProfileDisplayPage extends StatelessWidget {
  final String fullName;
  final String address;
  final String phoneNumber;
  final File? profileImage;

  ProfileDisplayPage({
    required this.fullName,
    required this.address,
    required this.phoneNumber,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profileImage != null
                ? ClipOval(
                    child: Image.file(
                      profileImage!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.person,
                    size: 150,
                  ),
            const SizedBox(height: 20),
            const Text(
              'Full Name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              fullName,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Address:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              address,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Phone Number:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              phoneNumber,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
