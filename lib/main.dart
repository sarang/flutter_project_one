import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': "What's your favourite colour?",
        'answers': ["Blue", "Black", "Green", "Red"]
      },
      {
        'questionText': "What's your favourite animal?",
        'answers': ["Dog", "Cat", "Tiger", "Lion"]
      },
      {
        'questionText': "What's your favourite food?",
        'answers': ["Pasta", "Biriyani", "Fries", "Tandoori chi"]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText']?.toString() ?? '',
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
