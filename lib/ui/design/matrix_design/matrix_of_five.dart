import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:wordsearchpuzzle/constants/colors.dart';
import 'package:wordsearchpuzzle/state_management/database/list_of_matrix.dart';
import 'package:wordsearchpuzzle/state_management/database/list_of_words.dart';
import 'package:wordsearchpuzzle/ui/design/word_design/completed_word.dart';
import 'package:wordsearchpuzzle/ui/design/word_design/normal_word.dart';

class FiveByFiveMatrixDesign extends StatefulWidget {
  final int randNum;
  final Function(int) onScoreChanged;
  const FiveByFiveMatrixDesign({
    Key? key,
    required this.randNum,
    required this.onScoreChanged,
  }) : super(key: key);

  @override
  _FiveByFiveMatrixDesignState createState() => _FiveByFiveMatrixDesignState();
}

class _FiveByFiveMatrixDesignState extends State<FiveByFiveMatrixDesign> {
  String tempWord = '';
  int listLength = 0;
  List completedWords = [];

  // Custom Painter
  // Offset initialOffset = Offset.zero;
  // Offset endOffset = Offset.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List wordList = WordList.listOfFiveByFiveWords[widget.randNum];
    List matrixList = MatrixList.listOfFiveByFiveMatrix[widget.randNum];
    listLength = wordList.length;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.all(10.0),
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColors.pageBackgroundColor,
            ),
            child: Center(
              //TODO: fetch words from the database and display here
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      listLength >= 1
                          ? completedWords.contains(wordList[0])
                              ? CompletedWordDesign(word: wordList[0])
                              : NormalWordDesign(word: wordList[0])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 2
                          ? completedWords.contains(wordList[1])
                              ? CompletedWordDesign(word: wordList[1])
                              : NormalWordDesign(
                                  word: wordList[1],
                                )
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 3
                          ? completedWords.contains(wordList[2])
                              ? CompletedWordDesign(word: wordList[2])
                              : NormalWordDesign(
                                  word: wordList[2],
                                )
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 4
                          ? completedWords.contains(wordList[3])
                              ? CompletedWordDesign(word: wordList[3])
                              : NormalWordDesign(
                                  word: wordList[3],
                                )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      listLength >= 5
                          ? completedWords.contains(wordList[4])
                              ? CompletedWordDesign(word: wordList[4])
                              : NormalWordDesign(
                                  word: wordList[4],
                                )
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 6
                          ? completedWords.contains(wordList[5])
                              ? CompletedWordDesign(word: wordList[5])
                              : NormalWordDesign(
                                  word: wordList[5],
                                )
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 7
                          ? completedWords.contains(wordList[6])
                              ? CompletedWordDesign(word: wordList[6])
                              : NormalWordDesign(
                                  word: wordList[6],
                                )
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 8
                          ? completedWords.contains(wordList[7])
                              ? CompletedWordDesign(word: wordList[7])
                              : NormalWordDesign(
                                  word: wordList[7],
                                )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // middle text controller
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                        onTap: () {
                          //TODO: add selection undo event
                          setState(() {
                            if (tempWord.isNotEmpty) {
                              tempWord =
                                  tempWord.substring(0, tempWord.length - 1);
                            }
                          });
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        tempWord,
                        style: TextStyle(
                          color: CustomColors.primaryTextColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
                          //TODO: add string clear event
                          setState(() {
                            tempWord = '';
                          });
                        },
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                height: 380,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomColors.menuBackgroundColor,
                ),
                //TODO: add each and every letter from the list of matrix
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[0][0])),
                            child: getLetterDesign(word: matrixList[0][0]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () => setState(
                                  () => checkInput(wordList, matrixList[0][1])),
                              child: getLetterDesign(word: matrixList[0][1])),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[0][2])),
                            child: getLetterDesign(word: matrixList[0][2]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[0][3])),
                            child: getLetterDesign(word: matrixList[0][3]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[0][4])),
                            child: getLetterDesign(word: matrixList[0][4]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[1][0])),
                            child: getLetterDesign(word: matrixList[1][0]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () => setState(
                                  () => checkInput(wordList, matrixList[1][1])),
                              child: getLetterDesign(word: matrixList[1][1])),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[1][2])),
                            child: getLetterDesign(word: matrixList[1][2]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[1][3])),
                            child: getLetterDesign(word: matrixList[1][3]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[1][4])),
                            child: getLetterDesign(word: matrixList[1][4]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[2][0])),
                            child: getLetterDesign(word: matrixList[2][0]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () => setState(
                                  () => checkInput(wordList, matrixList[2][1])),
                              child: getLetterDesign(word: matrixList[2][1])),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[2][2])),
                            child: getLetterDesign(word: matrixList[2][2]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[2][3])),
                            child: getLetterDesign(word: matrixList[2][3]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[2][4])),
                            child: getLetterDesign(word: matrixList[2][4]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // InkWell to make each letter item clickable
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[3][0])),
                            child: getLetterDesign(word: matrixList[3][0]),
                          ),
                          // Giving Space
                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () => setState(
                                  () => checkInput(wordList, matrixList[3][1])),
                              child: getLetterDesign(word: matrixList[3][1])),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[3][2])),
                            child: getLetterDesign(word: matrixList[3][2]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[3][3])),
                            child: getLetterDesign(word: matrixList[3][3]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[3][4])),
                            child: getLetterDesign(word: matrixList[3][4]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[4][0])),
                            child: getLetterDesign(word: matrixList[4][0]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () => setState(
                                  () => checkInput(wordList, matrixList[4][1])),
                              child: getLetterDesign(word: matrixList[4][1])),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[4][2])),
                            child: getLetterDesign(word: matrixList[4][2]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[4][3])),
                            child: getLetterDesign(word: matrixList[4][3]),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () => setState(
                                () => checkInput(wordList, matrixList[4][4])),
                            child: getLetterDesign(word: matrixList[4][4]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // TODO: Add Gesture Painting for selection
              // GestureDetector(
              //   onPanStart: (details) {
              //     setState(() {
              //       initialOffset = details.localPosition;
              //     });
              //   },
              //   onPanUpdate: (details) {
              //     setState(() {
              //       endOffset = details.localPosition;
              //     });
              //   },
              //   child: CustomPaint(
              //     painter: _DrawingPainter(initialOffset, endOffset),
              //     child: Container(
              //       margin: const EdgeInsets.all(10),
              //       padding: const EdgeInsets.all(20),
              //       height: 380,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  void checkInput(List wordList, String letter) {
    tempWord = tempWord + letter;
    if (wordList.contains(tempWord)) {
      completedWords.add(tempWord);
      widget.onScoreChanged(completedWords.length);
      tempWord = '';
    }
  }

  Widget getLetterDesign({required String word}) {
    return Container(
      height: 50,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          word,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final Offset _initialOffset;
  final Offset _endOffset;
  _DrawingPainter(this._initialOffset, this._endOffset);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.white
      ..strokeWidth = 15;
    canvas.drawLine(_initialOffset, _endOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
