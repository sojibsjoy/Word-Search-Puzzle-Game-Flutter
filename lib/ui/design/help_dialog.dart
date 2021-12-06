import 'package:flutter/material.dart';
import 'package:wordsearchpuzzle/constants/colors.dart';
import 'package:wordsearchpuzzle/constants/instructions.dart';

class HelpDialog extends StatefulWidget {
  const HelpDialog({Key? key}) : super(key: key);

  @override
  State<HelpDialog> createState() => _HelpDialogState();
}

class _HelpDialogState extends State<HelpDialog> {
  int pageNo = 1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.colorBG,
      title: Center(
        child: Text(
          "How to play",
          style: TextStyle(
            color: CustomColors.primaryTextColor,
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
          child: getDetails(),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (pageNo > 1) {
                      pageNo--;
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 180,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    pageNo == 1 ? filledCon() : emplyCon(),
                    pageNo == 2 ? filledCon() : emplyCon(),
                    pageNo == 3 ? filledCon() : emplyCon(),
                    pageNo == 4 ? filledCon() : emplyCon(),
                    pageNo == 5 ? filledCon() : emplyCon(),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (pageNo < 5) {
                      pageNo++;
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                ),
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getDetails() {
    switch (pageNo) {
      case 1:
        return inst1Detials();
      case 2:
        return const Text('New Window');
      default:
        return inst1Detials();
    }
  }
  Column inst1Detials() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/ins1.png'),
        const SizedBox(
          height: 30,
        ),
        Text(
          Instructions.ins1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Container filledCon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      height: 12,
      width: 12,
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
      height: 14,
      width: 14,
    );
  }
}
