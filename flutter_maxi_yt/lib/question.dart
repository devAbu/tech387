import 'package:flutter/material.dart';

class Question extends StatelessWidget {
/*   const Question({super.key});*/
  final String questionText;
  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
    /* Center(
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 24),
      ),
    ); */
  }
}
