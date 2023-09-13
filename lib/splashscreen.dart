// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:serenitybyfatima/homescreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 247, 50, 115),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  pause: const Duration(seconds: 1250),
                  isRepeatingAnimation: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    FadeAnimatedText(
                      "Serenity",
                      textStyle:
                          const TextStyle(fontFamily: "Adelia", fontSize: 50),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      "By Fatima",
                      speed: const Duration(milliseconds: 50),
                      textStyle:
                          const TextStyle(fontFamily: "Quinger", fontSize: 35),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
