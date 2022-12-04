import 'package:flutter/material.dart';
import 'package:flutter_maxi_yt/answer.dart';
import './question.dart';

/* void main() {
  runApp(MyApp());
} */

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': ['Blue', 'Red', 'Green', 'Black'],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': ['Cat', 'Horse', 'Lion'],
    },
    {
      'questionText': "What's your favorite programming language?",
      'answers': ['JS', 'C++', 'C#', 'Java'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'] as String,
                  ),
                  /* Text(
              questions[_questionIndex],
            ), */
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Column(
                children: [
                  const Text('You did it'),
                  ElevatedButton(
                    onPressed: resetQuiz,
                    child: const Text('Restart'),
                  )
                ],
              ),
      ),
    );
  }
}
