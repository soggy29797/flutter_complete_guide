import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore=0;

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [{'text':'Black', 'score':10},
        {'text':'Red', 'score':7},
        {'text':'Green', 'score':3},
        {'text':'White', 'score':1}]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [{'text':'Rabbit', 'score':1},
        {'text':'Snake', 'score':10},
        {'text':'Elephant', 'score':6},
        {'text':'Lion', 'score':6}]
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [{'text':'Max', 'score':4},
        {'text':'Max', 'score':4},
        {'text':'Max', 'score':4},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore+=score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("We have no more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < _questions.length
            ? Quiz(
            questions: _questions,
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex)
            : Result(_totalScore,_resetQuiz)),
      ),
    );
  }
}
