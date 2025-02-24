# standard_bank_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Arithmetic Drill App for Children
 
# 🎯 Math Quiz App  

A fun and interactive *math quiz* designed to help children improve their math skills through *dynamic questions, engaging visuals, and personalized avatars*.

---

## *🚀 Approach & Development*  
I focused on making *learning math fun* by incorporating:  
*Randomly generated math questions* based on difficulty.  
*Real-time feedback* with floating animations (Stars for correct, Xs for wrong).  
*A visually engaging background* for a fun learning experience.  
*Avatar selection* so players can personalize their experience.  

---

## *🔹 Features Implemented*  
✔ *Dynamic Question Generation* (Easy, Medium, Hard).  
✔ *Floating animations (Stars & Xs) for correct/incorrect answers*.  
✔ *Real-time score updates* with difficulty-based challenges.  
✔ *Custom background image for an immersive UI*.  
✔ *Player avatar selection to personalize the experience*.  

---

## *📦 External Libraries Used*  
The app uses the following Flutter packages:  

| Library                | Purpose      |
|----------------------- |---------     |
| flutter/material.dart  | UI framework |
| dart:math              | Random number generation |

# Steps for the application from the user’s perspective:

1️ User Enters Their Name
	•	The app starts on a welcome screen where users are asked to enter their name.
	•	A text field is provided for input.
	•	Once the name is entered, the user taps the “Next” button to proceed.

2️ User Chooses an Avatar
	•	The user is taken to an avatar selection screen.
	•	Several avatar options (e.g., different characters) are displayed.
	•	The user taps on their preferred avatar to start the Quiz game.
	

3️ The Quiz Begins
	•	The Math Quiz screen loads, showing:
a.	User’s name & avatar at the top.
b.	Score counter (starts at 0).
c.	Random math question based on the selected difficulty.
d.	Input field for the answer.
e.	Submit button to check the answer.

4️ Answering Questions
	•	The user enters their answer in the text field and taps “Submit”.
	•	If correct, ✨ stars appear, and +10 points are added.
	•	If wrong, ❌ Xs appear, and the correct answer is shown.
	•	After a short delay, a new question is generated.

5️ Changing Difficulty (Optional)
	•	Users can change the difficulty level (Easy, Medium, Hard) using a menu in the app bar.
	•	When changing difficulty, the score resets and new questions appear.

6️ Game Continues Until User Exits
	•	The user continues answering questions and improving their score.
	•	They can restart the game at any time or exit the app when done.

# Credits & References

	•	Flutter Documentation – flutter.dev (for UI components and state management).
	•	Dart Documentation – dart.dev (for handling logic and random number generation).
	•	Stack Overflow & Flutter Community – For troubleshooting and debugging.
	•	Online Tutorials & Articles – Various resources for learning animations and avatar selection.
	•	Icons & Assets – (images, downloaded from google”).
	•   ChatGPT for adding the animated stars and Xs

