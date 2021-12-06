import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wordsearchpuzzle/constants/colors.dart';
import 'package:wordsearchpuzzle/state_management/database/list_of_matrix.dart';
import 'package:wordsearchpuzzle/state_management/database/list_of_words.dart';
import 'package:wordsearchpuzzle/ui/design/word_design/completed_word_eight.dart';
import 'package:wordsearchpuzzle/ui/design/word_design/normal_word_eight.dart';

class EightByEightMatrixDesign extends StatefulWidget {
  final int randNum;
  final Function(int) onScoreChanged;
  const EightByEightMatrixDesign({
    Key? key,
    required this.randNum,
    required this.onScoreChanged,
  }) : super(key: key);

  @override
  _EightByEightMatrixDesignState createState() =>
      _EightByEightMatrixDesignState();
}

class _EightByEightMatrixDesignState extends State<EightByEightMatrixDesign> {
  String tempWord = '';
  int listLength = 0;
  List completedWords = [];

  @override
  Widget build(BuildContext context) {
    List wordList = WordList.listOfEightByEightWords[widget.randNum];
    List matrixList = MatrixList.listOfEightByEightMatrix[widget.randNum];
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
                              ? CompletedWordEightDesign(word: wordList[0])
                              : NormalWordEightDesign(word: wordList[0])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 2
                          ? completedWords.contains(wordList[1])
                              ? CompletedWordEightDesign(word: wordList[1])
                              : NormalWordEightDesign(word: wordList[1])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 3
                          ? completedWords.contains(wordList[2])
                              ? CompletedWordEightDesign(word: wordList[2])
                              : NormalWordEightDesign(word: wordList[2])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 4
                          ? completedWords.contains(wordList[3])
                              ? CompletedWordEightDesign(word: wordList[3])
                              : NormalWordEightDesign(word: wordList[3])
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      listLength >= 5
                          ? completedWords.contains(wordList[4])
                              ? CompletedWordEightDesign(word: wordList[4])
                              : NormalWordEightDesign(word: wordList[4])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 6
                          ? completedWords.contains(wordList[5])
                              ? CompletedWordEightDesign(word: wordList[5])
                              : NormalWordEightDesign(word: wordList[5])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 7
                          ? completedWords.contains(wordList[6])
                              ? CompletedWordEightDesign(word: wordList[6])
                              : NormalWordEightDesign(word: wordList[6])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 8
                          ? completedWords.contains(wordList[7])
                              ? CompletedWordEightDesign(word: wordList[7])
                              : NormalWordEightDesign(word: wordList[7])
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      listLength >= 9
                          ? completedWords.contains(wordList[8])
                              ? CompletedWordEightDesign(word: wordList[8])
                              : NormalWordEightDesign(word: wordList[8])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 10
                          ? completedWords.contains(wordList[9])
                              ? CompletedWordEightDesign(word: wordList[9])
                              : NormalWordEightDesign(word: wordList[9])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 11
                          ? completedWords.contains(wordList[10])
                              ? CompletedWordEightDesign(word: wordList[10])
                              : NormalWordEightDesign(word: wordList[10])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 12
                          ? completedWords.contains(wordList[11])
                              ? CompletedWordEightDesign(word: wordList[11])
                              : NormalWordEightDesign(word: wordList[11])
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      listLength >= 13
                          ? completedWords.contains(wordList[12])
                              ? CompletedWordEightDesign(word: wordList[12])
                              : NormalWordEightDesign(word: wordList[12])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 14
                          ? completedWords.contains(wordList[13])
                              ? CompletedWordEightDesign(word: wordList[13])
                              : NormalWordEightDesign(word: wordList[13])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 15
                          ? completedWords.contains(wordList[14])
                              ? CompletedWordEightDesign(word: wordList[14])
                              : NormalWordEightDesign(word: wordList[14])
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      listLength >= 16
                          ? completedWords.contains(wordList[15])
                              ? CompletedWordEightDesign(word: wordList[15])
                              : NormalWordEightDesign(word: wordList[15])
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          middleView(),
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
                mainAxisSize: MainAxisSize.min,
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
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[0][5])),
                        child: getLetterDesign(word: matrixList[0][5]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[0][6])),
                        child: getLetterDesign(word: matrixList[0][6]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[0][7])),
                        child: getLetterDesign(word: matrixList[0][7]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
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
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[1][5])),
                        child: getLetterDesign(word: matrixList[1][5]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[1][6])),
                        child: getLetterDesign(word: matrixList[1][6]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[1][7])),
                        child: getLetterDesign(word: matrixList[1][7]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
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
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[2][5])),
                        child: getLetterDesign(word: matrixList[2][5]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[2][6])),
                        child: getLetterDesign(word: matrixList[2][6]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[2][7])),
                        child: getLetterDesign(word: matrixList[2][7]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[3][0])),
                        child: getLetterDesign(word: matrixList[3][0]),
                      ),
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
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[3][5])),
                        child: getLetterDesign(word: matrixList[3][5]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[3][6])),
                        child: getLetterDesign(word: matrixList[3][6]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[3][7])),
                        child: getLetterDesign(word: matrixList[3][7]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
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
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[4][5])),
                        child: getLetterDesign(word: matrixList[4][5]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[4][6])),
                        child: getLetterDesign(word: matrixList[4][6]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[4][7])),
                        child: getLetterDesign(word: matrixList[4][7]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[5][0])),
                        child: getLetterDesign(word: matrixList[5][0]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                          onTap: () => setState(
                              () => checkInput(wordList, matrixList[5][1])),
                          child: getLetterDesign(word: matrixList[5][1])),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[5][2])),
                        child: getLetterDesign(word: matrixList[5][2]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[5][3])),
                        child: getLetterDesign(word: matrixList[5][3]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[5][4])),
                        child: getLetterDesign(word: matrixList[5][4]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[5][5])),
                        child: getLetterDesign(word: matrixList[5][5]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[5][6])),
                        child: getLetterDesign(word: matrixList[5][6]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[5][7])),
                        child: getLetterDesign(word: matrixList[5][7]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[6][0])),
                        child: getLetterDesign(word: matrixList[6][0]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                          onTap: () => setState(
                              () => checkInput(wordList, matrixList[6][1])),
                          child: getLetterDesign(word: matrixList[6][1])),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[6][2])),
                        child: getLetterDesign(word: matrixList[6][2]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[6][3])),
                        child: getLetterDesign(word: matrixList[6][3]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[6][4])),
                        child: getLetterDesign(word: matrixList[6][4]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[6][5])),
                        child: getLetterDesign(word: matrixList[6][5]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[6][6])),
                        child: getLetterDesign(word: matrixList[6][6]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[6][7])),
                        child: getLetterDesign(word: matrixList[6][7]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[7][0])),
                        child: getLetterDesign(word: matrixList[7][0]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                          onTap: () => setState(
                              () => checkInput(wordList, matrixList[7][1])),
                          child: getLetterDesign(word: matrixList[7][1])),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[7][2])),
                        child: getLetterDesign(word: matrixList[7][2]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[7][3])),
                        child: getLetterDesign(word: matrixList[7][3]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[7][4])),
                        child: getLetterDesign(word: matrixList[7][4]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[7][5])),
                        child: getLetterDesign(word: matrixList[7][5]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[7][6])),
                        child: getLetterDesign(word: matrixList[7][6]),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => setState(
                            () => checkInput(wordList, matrixList[7][7])),
                        child: getLetterDesign(word: matrixList[7][7]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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

  Container middleView() {
    return Container(
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
                      tempWord = tempWord.substring(0, tempWord.length - 1);
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
    );
  }

  Widget getLetterDesign({required String word}) {
    return Container(
      height: 35,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          word,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
