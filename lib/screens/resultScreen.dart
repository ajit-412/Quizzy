import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzy/constants/questionSynopsis.dart';
import 'package:quizzy/data/questions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultScreen extends StatelessWidget {
  final List<String> selectedAnswers;

  final void Function() onRestart;

  const ResultScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });

  // const ResultScreen({super.key, required this.selectedAnswers});

  List<Map<String, Object>> get DataSynopsis {
    final List<Map<String, Object>> synopsis = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      synopsis.add({
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'user-answer': selectedAnswers[i],
      });
    }

    return synopsis;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final correctQuestions = DataSynopsis.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$correctQuestions out of $totalQuestions questions are answered correctly',
              style: GoogleFonts.nunito(
                color: Colors.yellowAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            QuestionsSummary(DataSynopsis),
            const SizedBox(
              height: 30.0,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(FontAwesomeIcons.repeat),
              label: Text(
                'Restart Quiz!',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
