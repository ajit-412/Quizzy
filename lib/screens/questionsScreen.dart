import 'package:flutter/material.dart';
import 'package:quizzy/constants/answerBtn.dart';
import 'package:quizzy/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {

  final void Function(String answer) onSelectAnswer;

  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void getQuestionIndex(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                color: Color.fromARGB(255, 196, 255, 228),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            ...currentQuestion.ShuffleAnswerList.map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onPressed: (){
                    getQuestionIndex(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
