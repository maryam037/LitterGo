  // Function to show an error snackbar
  import 'package:flutter/material.dart';

Future<void> showErrorSnackbar(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center,),
        duration: const Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }