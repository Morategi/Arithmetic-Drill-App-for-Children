import 'package:flutter/material.dart';
import 'package:standard_bank_project/MathQuiz.dart';

class AvatarSelectionScreen extends StatelessWidget {
  final String playerName;

  const AvatarSelectionScreen({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Same background as login
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Your Avatar",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),

              // Avatar choices
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _avatarButton(context, "assets/avatar1.jpeg"),
                  _avatarButton(context, "assets/avatar2.jpeg"),
                  _avatarButton(context, "assets/avatar3.jpeg"),
                  _avatarButton(context, "assets/avatar4.jpeg"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarButton(BuildContext context, String avatarPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MathQuizScreen(playerName: playerName, avatar: avatarPath),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(avatarPath, width: 80, height: 80),
      ),
    );
  }
}