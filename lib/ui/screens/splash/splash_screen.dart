import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wordsearchpuzzle/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(
        HomeScreen.routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/splash.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(51, 0, 102, 0.6),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: 220,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Word Search Puzzle",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Increment Inc.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        SpinKitCubeGrid(
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
