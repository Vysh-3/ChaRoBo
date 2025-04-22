import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'package:chatbot/presentation/routes/app_pages.dart';

class WelcomeUserScreen extends StatelessWidget {
  const WelcomeUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    print('Welcome screen name: ${authController.name.value}');
    return Scaffold(
      body: Container(
        color: Colors.white, // Plain background instead of dotted
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0), // Padding for spacing
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/charobo_icon.png',
                  height: 200, // Adjust height to match design
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 32),
                Text(
                  'Welcome, ${authController.name.value}! 👋 ',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Let's Have Fun with ChaRoBo!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start a conversation with ChaRoBo right now!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0), // Space between button and screen bottom
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF26A69A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      minimumSize: const Size(200, 50), // Fixed width for centered button
                    ),
                    onPressed: () => Get.offAllNamed(AppRoutes.chatbot),
                    child: const Text(
                      'Start Chat with ChaRoBo',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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