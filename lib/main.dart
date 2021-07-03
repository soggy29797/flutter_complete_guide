import 'package:flutter/material.dart';

import './question.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favourite color??',
      'What\'s your favourite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions.elementAt(_questionIndex),
            ),
            RaisedButton(
              child: Text('Answ1'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answ2'),
              onPressed: () => print("answer2 chosen"),
            ),
            RaisedButton(
              child: Text('Answ3'),
              onPressed: () {
                print("answer3 chosen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
