import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizzy/constants/questionIdentifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user-answer'] == itemData['correct-answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question-index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['user-answer'] as String,
                    style: GoogleFonts.nunito(
                      color: const Color.fromARGB(255, 218, 168, 168),
                    )),
                Text(itemData['correct-answer'] as String,
                    style: GoogleFonts.nunito(
                      color: Color.fromARGB(255, 104, 193, 253),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}