import 'package:flutter/material.dart';

class NormalWordDesign extends StatelessWidget {
  final String word;
  const NormalWordDesign({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 98,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          word,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
