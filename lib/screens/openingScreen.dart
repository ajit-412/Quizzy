import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpeningScreen extends StatelessWidget {

  final void Function() openQuiz;

  const OpeningScreen(this.openQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/question.png',
                width: 500.0,
                height: 350.0,
              ),
              Text(
                'Quizzy',
                style: GoogleFonts.amita(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 253, 255, 190),
                ),
              ),
              OutlinedButton.icon(
                onPressed: openQuiz,
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.lightGreenAccent,
                    surfaceTintColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    )),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: Text(
                  'Start Quiz',
                  style: GoogleFonts.nunito(),
                ),
              ),
            ],
          ),
        );
  }
}



