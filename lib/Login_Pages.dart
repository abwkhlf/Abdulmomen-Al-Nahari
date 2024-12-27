import 'package:flutter/material.dart';

import 'Widget_Button.dart';
import 'Widget_Image.dart';
import 'Widget_Input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BubblesWidget(
            bubbles: [
              {
                'imagePath': 'Images/bubble 02.png',
                'top': -5.0,
                'left': -5.0,
                'width': 300.0
              },
              {
                'imagePath': 'Images/bubble 01.png',
                'top': -5.0,
                'left': -5.0,
                'width': 250.0
              },
              {
                'imagePath': 'Images/bubblle 03.png',
                'top': 100.0,
                'left': null,
                'right': -65.0,
                'width': 200.0
              },
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 450),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Good to see you back! 🖤",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                const CustomTextField(
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 80),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Next",
                    color: Colors.blue,
                    onPressed: () {
                      // Add your logic here
                    },
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Add your logic here
                  },
                  child: const Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
