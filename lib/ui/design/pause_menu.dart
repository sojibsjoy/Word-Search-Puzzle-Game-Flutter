import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsearchpuzzle/constants/colors.dart';
import 'package:wordsearchpuzzle/ui/screens/home/home_screen.dart';
import 'package:wordsearchpuzzle/ui/screens/play/play_screen.dart';

class PauseMenu extends StatefulWidget {
  final dynamic args;
  const PauseMenu({Key? key,required this.args}) : super(key: key);

  @override
  State<PauseMenu> createState() => _PauseMenuState();
}

class _PauseMenuState extends State<PauseMenu> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.colorBG,
      title: Center(
        child: Text(
          "Paused",
          style: TextStyle(
            color: CustomColors.primaryTextColor,
            fontSize: 25,
          ),
        ),
      ),
      content: Container(
        height: 220,
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
                // Resume
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: pauseMenuItem(Icons.play_arrow, "Resume"),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Restart
                InkWell(
                  onTap: () {
                    //TODO: add restart logic
                    Get.offAllNamed(PlayScreen.routeName, arguments: [
                      widget.args[0],
                      widget.args[1],
                    ]);
                  },
                  child: pauseMenuItem(Icons.loop, "Restart"),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Home
                InkWell(
                  onTap: () {
                    Get.offAllNamed(HomeScreen.routeName);
                  },
                  child: pauseMenuItem(Icons.home, "Home"),
                ),
              ],
            ),
          ),
        ),
      ),
      //TODO: add cancel buttons to the alert dialog
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

  Widget pauseMenuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Icon(
                  icon,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  color: CustomColors.primaryTextColor,
                  fontSize: 23,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
