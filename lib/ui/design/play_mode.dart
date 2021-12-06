import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsearchpuzzle/constants/colors.dart';
import 'package:wordsearchpuzzle/ui/design/time_limit.dart';

class PlayMode extends StatefulWidget {
  const PlayMode({Key? key}) : super(key: key);

  @override
  State<PlayMode> createState() => _PlayModeState();
}

class _PlayModeState extends State<PlayMode> {
  int _selectedMode = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.colorBG,
      title: Center(
        child: Text(
          "Play Mode",
          style: TextStyle(
            color: CustomColors.primaryTextColor,
            fontSize: 25,
          ),
        ),
      ),
      content: Container(
        height: 400,
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CustomColors.menuBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 1;
                      Get.dialog(
                        const TimeLimit(playMode: 1),
                      );
                    });
                  },
                  child: modeItem('Extremely Easy', 1),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 2;
                      Get.dialog(
                        const TimeLimit(playMode: 2),
                      );
                    });
                  },
                  child: modeItem('Very Easy', 2),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 3;
                      Get.dialog(
                        const TimeLimit(playMode: 3),
                      );
                    });
                  },
                  child: modeItem('Easy', 3),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 4;
                      Get.dialog(
                        const TimeLimit(playMode: 4),
                      );
                    });
                  },
                  child: modeItem('Medium', 4),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 5;
                      Get.dialog(
                        const TimeLimit(playMode: 5),
                      );
                    });
                  },
                  child: modeItem('Difficult', 5),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 6;
                      Get.dialog(
                        const TimeLimit(playMode: 6),
                      );
                    });
                  },
                  child: modeItem('Very Difficult', 6),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 7;
                      Get.dialog(
                        const TimeLimit(playMode: 7),
                      );
                    });
                  },
                  child: modeItem('Extremely Difficult', 7),
                ),
              ],
            ),
          ),
        ),
      ),
      // TODO: add actions to cancel the alert dialog
      actions: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 180,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget modeItem(String title, int itemIndex) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          _selectedMode == itemIndex ? filledCon() : emptyCon(),
          const SizedBox(
            width: 12,
          ),
          Text(
            title,
            style: TextStyle(
              color: CustomColors.primaryTextColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Container filledCon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      height: 22,
      width: 22,
    );
  }

  Container emptyCon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      height: 24,
      width: 24,
    );
  }
}
