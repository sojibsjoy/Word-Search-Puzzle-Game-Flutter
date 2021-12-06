import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsearchpuzzle/constants/colors.dart';
import 'package:wordsearchpuzzle/ui/screens/play/play_screen.dart';

class TimeLimit extends StatefulWidget {
  final int playMode;
  const TimeLimit({Key? key, required this.playMode}) : super(key: key);

  @override
  State<TimeLimit> createState() => _TimeLimitState();
}

class _TimeLimitState extends State<TimeLimit> {
  int _selectedMode = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.colorBG,
      title: Center(
        child: Text(
          "Time Limit",
          style: TextStyle(
            color: CustomColors.primaryTextColor,
            fontSize: 25,
          ),
        ),
      ),
      content: Container(
        height: 150,
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
                // Limited time
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 1;
                      Get.offAllNamed(PlayScreen.routeName, arguments: [
                        true,
                        widget.playMode,
                      ]);
                    });
                  },
                  child: modeItem('Limited Time', 1),
                ),
                // Unlimited time
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMode = 2;
                      Get.offAllNamed(PlayScreen.routeName, arguments: [
                        false,
                        widget.playMode,
                      ]);
                    });
                  },
                  child: modeItem('Unlimited Time', 2),
                ),
              ],
            ),
          ),
        ),
      ),
      //TODO: add action button to cancel the alert dialog
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
          _selectedMode == itemIndex ? filledCon() : emplyCon(),
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

  Container emplyCon() {
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
