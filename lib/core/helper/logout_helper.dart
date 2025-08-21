import 'package:flutter/material.dart';
import 'package:social_meda/core/helper/snak_bar_method.dart';
import 'package:social_meda/core/services/firebase_auth_service.dart';
import 'package:social_meda/features/auth/presentation/views/login_page.dart';

class LogoutHelper {
  static Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // must choose Yes or Cancel
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Confirm Logout',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop(); // Close dialog
                await FirebaseAuthServices().signOut();

                // Navigate to login page
                Navigator.pushNamedAndRemoveUntil(
                  // ignore: use_build_context_synchronously
                  context,
                  LoginPage.routeName,
                  (route) => false,
                );

                // Show snackbar
                snakBarMethod(
                  // ignore: use_build_context_synchronously
                  context: context,
                  message: 'Logged out successfully',
                );
              },
              child: const Text('Yes, Logout'),
            ),
          ],
        );
      },
    );
  }
}
