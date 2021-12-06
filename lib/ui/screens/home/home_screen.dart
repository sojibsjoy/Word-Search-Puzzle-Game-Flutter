import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsearchpuzzle/ui/design/help_dialog.dart';
import 'package:wordsearchpuzzle/ui/design/play_mode.dart';
import 'package:wordsearchpuzzle/ui/screens/settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/appBG.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromRGBO(51, 0, 102, 0.6),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Word Search Puzzle',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Increment Inc.',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  // Play Button
                  TextButton(
                    onPressed: () {
                      Get.dialog(
                        const PlayMode(),
                      );
                      Get.dialog(
                        const PlayMode(),
                      );
                    },
                    child: const Text(
                      'Play',
                      style: TextStyle(
                        color: Colors.white,
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
                          MaterialStateProperty.all<Color>(Colors.pink),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // help button
                      InkWell(
                        onTap: () {
                          Get.dialog(const HelpDialog(),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 50,
                          width: 50,
                          child: const Center(
                            child: Icon(
                              Icons.help_outline,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      // settings icon
                      InkWell(
                        onTap: () {
                          Get.toNamed(SettingsScreen.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 50,
                          width: 50,
                          child: const Center(
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        //TODO: Add action to the star icon
                        onTap: () {
                          // star icon
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 50,
                          width: 50,
                          child: const Center(
                            child: Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
