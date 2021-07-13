import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20.0),
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text('True'),
              onPressed: () {
                //The user picked true.
                bool correctAnswer = quizBrain.getQuestionAnswer();

                setState(
                  () {
                    if (correctAnswer == true) {
                      print('User got it right');
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                      quizBrain.nextQuestion();
                    } else {
                      print('User got it wrong');
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                      quizBrain.nextQuestion();
                    }
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20.0),
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
              ),
              onPressed: () {
                //The user picked false.
                bool correctAnswer = quizBrain.getQuestionAnswer();

                if (correctAnswer == false) {
                  print('User got it right');
                } else {
                  print('User got it wrong');
                }
                setState(
                  () {
                    if (correctAnswer == false) {
                      print('User got it right');
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                      quizBrain.nextQuestion();
                    } else {
                      print('User got it wrong');
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                      quizBrain.nextQuestion();
                    }
                  },
                );
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
