import 'package:flutter/material.dart';

/* void main() {
  runApp(MyApp());
} */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Answer 1 chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite color?",
      "What's your favorite animal?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: Column(
          children: [
            const Text('The question!'),
            ElevatedButton(
              onPressed: answerQuestion,
              child: const Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: () => print('Answer 2 chosen'),
              child: const Text('Answer 2'),
            ),
            ElevatedButton(
              onPressed: () {
                print('Answer 3 chosen');
              },
              child: const Text('Answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
