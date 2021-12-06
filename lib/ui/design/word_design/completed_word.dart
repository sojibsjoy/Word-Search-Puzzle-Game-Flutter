import 'package:flutter/material.dart';

class CompletedWordDesign extends StatelessWidget {
  final String word;
  const CompletedWordDesign({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 98,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          word,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
