import 'package:flutter/material.dart';
import 'package:flutter_project_one/quiz.dart';
import 'package:flutter_project_one/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favourite colour?",
      'answers': [
        {"text": "Blue", "score": 5},
        {"text": "Black", "score": 10},
        {"text": "Green", "score": 3},
        {"text": "Red", "score": 7},
      ]
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {"text": "Dog", "score": 3},
        {"text": "Cat", "score": 5},
        {"text": "Tiger", "score": 7},
        {"text": "Lion", "score": 10},
      ]
    },
    {
      'questionText': "What's your favourite food?",
      'answers': [
        {"text": "Pasta", "score": 5},
        {"text": "Biriyani", "score": 10},
        {"text": "Fries", "score": 3},
        {"text": "Tandoori Chi", "score": 7},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("we have more questions");
    } else {
      print("no more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("My first app"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
