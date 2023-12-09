import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import './login.dart';
import 'package:lottie/lottie.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            // child: Icon(Icons.waving_hand, size: 50.0),
            child: Lottie.asset("assets/lotties/login.json"),
          ),
        ),
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            // child: Icon(Icons.people, size: 50.0),
            child: Lottie.asset("assets/lotties/mobile.json"),
          ),
        ),
      ],
      showNextButton: true,
      next: Text("Next >>"),
      done: const Text("Login"),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
  }
}
