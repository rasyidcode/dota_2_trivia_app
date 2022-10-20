import 'package:flutter/material.dart';

enum AnswerStatus {
  initial,
  selected,
  correct,
  incorrect,
}

class AnswerTextItem extends StatelessWidget {
  const AnswerTextItem({
    Key? key,
    required this.label,
    required this.content,
    required this.status,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final String content;
  final AnswerStatus status;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - (16 * 2 - 8);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: width,
        height: 90.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white10, width: 1.5),
          // color: Theme.of(context).primaryColor.withBlue(80).withOpacity(0.5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              if (status == AnswerStatus.initial)
                Theme.of(context).primaryColor
              else if (status == AnswerStatus.selected)
                Theme.of(context).primaryColor.withBlue(80)
              else if (status == AnswerStatus.correct)
                Theme.of(context).primaryColor.withBlue(80).withGreen(100)
              else if (status == AnswerStatus.incorrect)
                Theme.of(context).primaryColor.withBlue(80).withRed(100)
            ],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            Center(
              child: Text(
                content,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
