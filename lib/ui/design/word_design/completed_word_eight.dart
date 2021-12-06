import 'package:flutter/material.dart';

class CompletedWordEightDesign extends StatelessWidget {
  final String word;
  const CompletedWordEightDesign({Key? key, required this.word})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
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
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
