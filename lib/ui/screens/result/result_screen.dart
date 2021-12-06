import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsearchpuzzle/constants/colors.dart';
import 'package:wordsearchpuzzle/ui/design/play_mode.dart';
import 'package:wordsearchpuzzle/ui/screens/home/home_screen.dart';
import 'package:wordsearchpuzzle/ui/screens/play/play_screen.dart';

class ResultScreen extends StatefulWidget {
  static String routeName = '/result';
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _args = Get.arguments;
  ConfettiController? _confettiControllerLeft;
  ConfettiController? _confettiControllerRight;

  @override
  void initState() {
    _confettiControllerLeft =
        ConfettiController(duration: const Duration(seconds: 5));
    _confettiControllerLeft!.play();
    _confettiControllerRight =
        ConfettiController(duration: const Duration(seconds: 5));
    _confettiControllerRight!.play();
    super.initState();
  }

  @override
  void dispose() {
    _confettiControllerLeft!.dispose();
    _confettiControllerRight!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Congratulations!",
              style: TextStyle(
                color: CustomColors.primaryTextColor,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 80),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 350,
              width: 330,
              decoration: BoxDecoration(
                color: CustomColors.pageBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  resultItem(icon: Icons.grid_on_rounded, text: _args[0]),
                  resultItem(icon: Icons.local_parking, text: _args[1]),
                  resultItem(icon: Icons.lightbulb, text: _args[2]),
                  resultItem(icon: Icons.timer, text: _args[3]),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    //TODO: Add action to the big play button
                    onTap: () {},
                    child: const Icon(
                      Icons.play_circle_outlined,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.offAllNamed(HomeScreen.routeName),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConfettiWidget(
                  blastDirection: -pi / 2,
                  numberOfParticles: 50,
                  emissionFrequency: 0.01,
                  shouldLoop: false,
                  maxBlastForce: 100,
                  minBlastForce: 80,
                  confettiController: _confettiControllerLeft!,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(PlayScreen.routeName, arguments: [
                      _args[4],
                      _args[5],
                    ]);
                  },
                  child: const Text(
                    'Play Again',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(200, 50),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                ConfettiWidget(
                  blastDirection: -pi / 2,
                  numberOfParticles: 50,
                  emissionFrequency: 0.01,
                  shouldLoop: false,
                  maxBlastForce: 100,
                  minBlastForce: 80,
                  confettiController: _confettiControllerRight!,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget resultItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: CustomColors.primaryTextColor,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
