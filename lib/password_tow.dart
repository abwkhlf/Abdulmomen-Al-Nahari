import 'package:flutter/material.dart';

import 'Widget and text.dart';
import 'Widget_Image.dart';

class Password_tow extends StatelessWidget {
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                WidgetImages(
                  imagePath: 'Images/artist-2 1.png',
                  name: "Hello, Romina!!",
                ),
                const SizedBox(height: 40),
                const Text(
                  "Type your password",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    8,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: index < 8 ? Colors.red : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Forgot your password?",
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
