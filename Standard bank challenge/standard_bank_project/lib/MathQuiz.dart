import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart'; 


//Maths Quiz Screen (stfw because screen updates when userhas answered the question and a new question is generated, when the score changes as well as the floating reactions to the answered questions)
class MathQuizScreen extends StatefulWidget {
  final String playerName;
  final String avatar;

  
  const MathQuizScreen({super.key,  required this.playerName,  required this.avatar});

  @override
  _MathQuizScreenState createState() => _MathQuizScreenState();
}


class _MathQuizScreenState extends State<MathQuizScreen> {
  int score = 0;
  String feedbackMessage = ''; // Display correct or wrong depending on the answer
  String correctAnswerMessage = ''; // Show correct answer only when wrong
  String difficulty = 'Easy'; // Default difficulty
  String question = ''; // Store the question string
  int correctAnswer = 0; // Store the correct answer
  TextEditingController answerController = TextEditingController();
  List<Widget> floatingIcons = []; // List to store floating stars and Xs
  Random random = Random(); // To generate random numbers
 // late AudioPlayer _audioPlayer;
  @override
  void initState() {
     super.initState();
    //     _audioPlayer = AudioPlayer();  // Initialize the audio player
    // _audioPlayer.setReleaseMode(ReleaseMode.loop);  // Make it loop
    // _audioPlayer.play(AssetSource('assets/kidsSong.mp3'));  
    generateQuestion();
  }

  // @override
  // void dispose() {
  //   _audioPlayer.stop();  // Stop the audio when leaving the screen
  //   super.dispose();
  // }


// The range of numbers based on the difficulty 
  void generateQuestion() {
    Random random = Random();
    int range = difficulty == 'Easy'
        ? 10
        : difficulty == 'Medium'
            ? 50
            : 100;

    List<String> operators = ['+', '-', '×', '÷'];

    if (difficulty == 'Hard') {
      int num1 = random.nextInt(range) + 1;
      int num2 = random.nextInt(range) + 1;
      int num3 = random.nextInt(range) + 1;
      int num4 = random.nextInt(range) + 1;
      List<String> hardOperators = [
        operators[random.nextInt(4)],
        operators[random.nextInt(4)],
        operators[random.nextInt(4)]
      ];

      bool useFourNumbers = random.nextBool();
      if (useFourNumbers) {
        question = '($num1 ${hardOperators[0]} $num2) ${hardOperators[1]} ($num3 ${hardOperators[2]} $num4)';
        correctAnswer = calculateHardAnswer(num1, num2, num3, num4, hardOperators);
      } else {
        question = '($num1 ${hardOperators[0]} $num2) ${hardOperators[1]} $num3';
        correctAnswer = calculateHardAnswer(num1, num2, num3, 0, hardOperators);
      }
    } else {
      int num1 = random.nextInt(range) + 1;
      int num2 = random.nextInt(range) + 1;
      String operator = operators[random.nextInt(4)];

      question = '$num1 $operator $num2';
      correctAnswer = calculateAnswer(num1, num2, operator);
    }

    setState(() {
      feedbackMessage = '';
      correctAnswerMessage = '';
    });
  }

  int calculateAnswer(int num1, int num2, String operator) {
    switch (operator) {
      case '+': return num1 + num2;
      case '-': return num1 - num2;
      case '×': return num1 * num2;
      case '÷': return num2 != 0 ? (num1 / num2).round() : num1;
      default: return 0;
    }
  }

  int calculateHardAnswer(int num1, int num2, int num3, int num4, List<String> operators) {
    int tempResult1 = calculateAnswer(num1, num2, operators[0]);
    int tempResult2 = calculateAnswer(num3, num4, operators[2]);
    return calculateAnswer(tempResult1, tempResult2, operators[1]);
  }

//checks the answers if corrects adds 10 points if wrong shows the correct answer
  void checkAnswer() {
    if (answerController.text.isEmpty) return;

    int userAnswer = int.tryParse(answerController.text) ?? -1;

    if (userAnswer == correctAnswer) {
      setState(() {
        score += 10;
        feedbackMessage = 'Correct! 🎉';
        correctAnswerMessage = '';
      });
      _showFloatingIcons(true);
    } else {
      setState(() {
        feedbackMessage = 'Wrong! 😢';
        correctAnswerMessage = 'The correct answer is: $correctAnswer';
      });
      _showFloatingIcons(false);
    }

    answerController.clear();
    Future.delayed(const Duration(seconds: 1), generateQuestion);
  }

// Shows 10 floating icons after each answer and disappears after 3 seconds
  void _showFloatingIcons(bool isCorrect) {
    setState(() {
      floatingIcons = List.generate(
        10, // Number of icons floating
        (index) => _buildFloatingIcon(isCorrect),
      );
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        floatingIcons.clear();
      });
    });
  }

// Helps the icons float upwards on the screen , stars shows youre correct and Xs shows you're wrong
  Widget _buildFloatingIcon(bool isCorrect) {
    double startX = random.nextDouble() * 300;
    return Positioned(
      left: startX,
      bottom: 0,
      child: TweenAnimationBuilder(
        tween: Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -3)),
        duration: const Duration(seconds: 2),
        builder: (context, Offset value, child) {
          return Transform.translate(
            offset: Offset(startX - 150, value.dy * 100),
            child: Icon(
              isCorrect ? Icons.star : Icons.close,
              color: isCorrect ? Colors.yellow : Colors.red,
              size: 35,
            ),
          );
        },
      ),
    );
  }

  void changeDifficulty(String newDifficulty) {
    setState(() {
      difficulty = newDifficulty;
      score = 0;
      generateQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Row(
          children: [
            Image.asset(widget.avatar, width: 40, height: 40), // Show avatar
            const SizedBox(width: 10),
            Text('${widget.playerName} - Math Quiz ($difficulty)', style: const TextStyle(color: Colors.white)),
          ],
        ),
       backgroundColor: Colors.blue[900],

        actions: [
          PopupMenuButton<String>(
            onSelected: changeDifficulty,
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'Easy', child: Text('Easy')),
              const PopupMenuItem(value: 'Medium', child: Text('Medium')),
              const PopupMenuItem(value: 'Hard', child: Text('Hard')),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'), // Ensure the image is in the assets folder
          fit: BoxFit.cover,
        ),
      ),
        child: Stack( children:[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to the test your maths Quiz!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(height: 20),
                Text(
                  'Score: $score',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  question,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),

                // White text for the Blue background
                TextField(
                  controller: answerController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter answer',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.blue[800],
                  ),
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: checkAnswer,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text('Submit', style: TextStyle(color: Colors.blue[900])),
                ),
                const SizedBox(height: 20),
                Text(
                  feedbackMessage,
                  style: TextStyle(fontSize: 20, color: feedbackMessage == 'Wrong! 😢' ? Colors.red : Colors.yellow),
                ),
                const SizedBox(height: 10),
                Text(
                  correctAnswerMessage,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          ...floatingIcons, // Display floating stars or Xs
        ],
      ),
      ),
    );
  }
}