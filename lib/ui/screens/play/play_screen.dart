import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:wordsearchpuzzle/constants/colors.dart';
import 'package:wordsearchpuzzle/state_management/database/list_of_words.dart';
import 'package:wordsearchpuzzle/ui/design/bnb_painter.dart';
import 'package:wordsearchpuzzle/ui/design/help_dialog.dart';
import 'package:wordsearchpuzzle/ui/design/matrix_design/matrix_of_eight.dart';
import 'package:wordsearchpuzzle/ui/design/matrix_design/matrix_of_five.dart';
import 'package:wordsearchpuzzle/ui/design/matrix_design/matrix_of_six.dart';
import 'package:wordsearchpuzzle/ui/design/pause_menu.dart';
import 'package:wordsearchpuzzle/ui/screens/result/result_screen.dart';
import 'package:wordsearchpuzzle/ui/screens/settings/settings_screen.dart';

class PlayScreen extends StatefulWidget {
  static String routeName = '/play';
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int countDown = 1;
  final oneSec = const Duration(seconds: 1);
  // getting args first
  final _args = Get.arguments;

  Timer? _timer;
  int _timeLimitMinute = 1;
  int _timeLimitSecond = 59;

  int _elapsedSecond = 00;
  int _elapsedMinute = 00;

  void startCountDownTimer() {
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_timeLimitMinute == 0 && _timeLimitSecond == 0) {
        setState(() => timer.cancel());
        Get.toNamed(
          ResultScreen.routeName,
          arguments: [
            '5x5',
            "$score",
            '0', // hints
            '01:12', // time
          ],
        );
      } else {
        if (_timeLimitMinute > 0 && _timeLimitSecond == 0) {
          setState(() {
            _timeLimitMinute -= countDown;
            _timeLimitSecond = 60;
          });
        }
        if (_timeLimitSecond > 0) {
          setState(() => _timeLimitSecond -= countDown);
        }
      }
    });
  }

  void startCountUpTimer() {
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        _elapsedSecond++;
        if (_elapsedSecond == 59) {
          _elapsedMinute++;
          _elapsedSecond = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  // generating random numbers on each play
  var ran = Random();
  // getting numbers of item to generate random numbers within it
  int totalItemOfFive = WordList.listOfFiveByFiveWords.length;
  int totalItemOfSix = WordList.listOfSixBySixWords.length;
  int totalItemOfEight = WordList.listOfEightByEightWords.length;
  //initializing 0 for null safety
  int randNumOfFive = 0;
  int randNumOfSix = 0;
  int randNumOfEight = 0;
  // getting length of randomized list to calculate the score
  int wordLengthOfFive = 0;
  int wordLengthOfSix = 0;
  int wordLengthOfEight = 0;

  bool limitedTime = false;
  int _playMode = 0;
  bool isPlaying = true;
  int score = 0;

  void generateRandomNum() {
    // generating the random numbers
    randNumOfFive = ran.nextInt(totalItemOfFive);
    randNumOfSix = ran.nextInt(totalItemOfSix);
    randNumOfEight = ran.nextInt(totalItemOfEight);

    // checking the length
    wordLengthOfFive = WordList.listOfFiveByFiveWords[randNumOfFive].length;
    wordLengthOfSix = WordList.listOfSixBySixWords[randNumOfSix].length;
    wordLengthOfEight = WordList.listOfEightByEightWords[randNumOfEight].length;
  }

  @override
  void initState() {
    // calling for generating random numbers before everything
    generateRandomNum();
    super.initState();
    if (_args[0]) {
      startCountDownTimer();
    } else {
      startCountUpTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Getting previous choice of Play & Time mode
    limitedTime = _args[0];
    _playMode = _args[1];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          //TODO: add word count
                          child: showScore(playMode: _playMode, score: score),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.timer_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                          const SizedBox(width: 10),
                          //TODO: add timer value
                          _args[0]
                              ? Text(
                                  _timeLimitSecond < 10
                                      ? "0$_timeLimitMinute:0$_timeLimitSecond"
                                      : "0$_timeLimitMinute:$_timeLimitSecond",
                                  style: TextStyle(
                                    color: CustomColors.primaryTextColor,
                                    fontSize: 30,
                                  ),
                                )
                              : Text(
                                  "$_elapsedMinute:$_elapsedSecond",
                                  style: TextStyle(
                                    color: CustomColors.primaryTextColor,
                                    fontSize: 30,
                                  ),
                                ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            //TODO: add Timer Pause/Play logic
                            setState(() {
                              isPlaying = !isPlaying;
                              if (!isPlaying) { // if false then =>
                                countDown = 0;
                              } else {
                                countDown = 1;
                              }
                            });
                            showDialog(
                              context: context,
                              builder: (context) => PauseMenu(args: _args,),
                            ).whenComplete(() {
                              setState(() {
                                isPlaying = !isPlaying;
                                if (!isPlaying) { // if false then =>
                                  countDown = 0;
                                } else {
                                  countDown = 1;
                                }
                              });
                            });
                          },
                          child: isPlaying
                              ? const Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            getPlayView(playMode: _playMode),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainer(),
            ),
            Stack(
              children: [
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                    //TODO: add hint showing logic
                    onPressed: () {
                      // Get.toNamed(ResultScreen.routeName);
                    },
                    backgroundColor: Colors.orange,
                    elevation: 0.1,
                    child: const Icon(
                      Icons.lightbulb,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const HelpDialog());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 45,
                      width: 45,
                      child: const Center(
                        child: Icon(
                          Icons.help_outline,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(SettingsScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 45,
                      width: 45,
                      child: const Center(
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text showScore({required int playMode, required int score}) {
    int _numOfWords = 0;
    switch (playMode) {
      case 3:
        _numOfWords = wordLengthOfFive;
        break;
      case 4:
        _numOfWords = wordLengthOfSix;
        break;
      case 5:
        _numOfWords = wordLengthOfEight;
        break;
      default:
    }
    return Text(
      "$_numOfWords/$score",
      style: TextStyle(
        color: CustomColors.primaryTextColor,
        fontSize: 17,
      ),
    );
  }

  Widget getPlayView({required int playMode}) {
    switch (playMode) {
      // 1 means Extremely Easy
      // 3 means Easy
      case 3:
        return FiveByFiveMatrixDesign(
          randNum: randNumOfFive,
          onScoreChanged: (int value) {
            setState(() {
              score = value;
              if (score == wordLengthOfFive) {
                if (_args[0]) {
                  Get.toNamed(
                    ResultScreen.routeName,
                    arguments: [
                      '5x5',
                      "$wordLengthOfFive:$score",
                      '0', // hints
                      '$_timeLimitMinute:$_timeLimitSecond', // time
                      _args[0],
                      _args[1],
                    ],
                  );
                } else {
                  Get.toNamed(
                    ResultScreen.routeName,
                    arguments: [
                      '5x5',
                      "$wordLengthOfFive:$score",
                      '0', // hints
                      '$_elapsedMinute:$_elapsedSecond', // time
                      _args[0],
                      _args[1],
                    ],
                  );
                }
              }
            });
          },
        );
      // 4 means Medium
      case 4:
        return SixBySixMatrixDesign(
          randNum: randNumOfSix,
          onScoreChanged: (int value) {
            setState(() {
              score = value;
              if (score == wordLengthOfSix) {
                if (_args[0]) {
                  Get.toNamed(
                    ResultScreen.routeName,
                    arguments: [
                      '6x6',
                      "$wordLengthOfSix:$score",
                      '0', // hints
                      '$_timeLimitMinute:$_timeLimitSecond', // time
                      _args[0],
                      _args[1],
                    ],
                  );
                } else {
                  Get.toNamed(
                    ResultScreen.routeName,
                    arguments: [
                      '6x6',
                      "$wordLengthOfSix:$score",
                      '0', // hints
                      '$_elapsedMinute:$_elapsedSecond', // time
                      _args[0],
                      _args[1],
                    ],
                  );
                }
              }
            });
          },
        );
      // 5 means Difficult
      case 5:
        return EightByEightMatrixDesign(
          randNum: randNumOfEight,
          onScoreChanged: (int value) {
            setState(() {
              score = value;
              if (score == wordLengthOfEight) {
                if (_args[0]) {
                  Get.toNamed(
                    ResultScreen.routeName,
                    arguments: [
                      '8x8',
                      "$wordLengthOfEight:$score",
                      '0', // hints
                      '$_timeLimitMinute:$_timeLimitSecond', // time
                      _args[0],
                      _args[1],
                    ],
                  );
                } else {
                  Get.toNamed(
                    ResultScreen.routeName,
                    arguments: [
                      '8x8',
                      "$wordLengthOfEight:$score",
                      '0', // hints
                      '$_elapsedMinute:$_elapsedSecond', // time
                      _args[0],
                      _args[1],
                    ],
                  );
                }
              }
            });
          },
        );
      default:
        return const Text('Loading Failed');
    }
  }
}
