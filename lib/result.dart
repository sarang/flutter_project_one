import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resultHandler;

  Result(this.resultScore, this.resultHandler);

  String get resultPhrase {
    String resultText = "You did it";
    if (resultScore <= 8) {
      resultText = "you're innocent and awesome";
    } else if (resultScore <= 12) {
      resultText = "you're okay";
    } else if (resultScore <= 16) {
      resultText = "you're strange";
    } else {
      resultText = "you're bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resultHandler,
            child: Text("Restart Quiz"),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
