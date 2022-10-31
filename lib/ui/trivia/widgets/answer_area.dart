import 'dart:developer';

import 'package:flutter/material.dart';

const List<Map<String, dynamic>> answers = [
  {
    'label': 'a',
    'content': 'Bloodseeker',
    'icon': null,
  },
  {
    'label': 'b',
    'content': 'Axe',
    'icon': null,
  },
  {
    'label': 'c',
    'content': 'Meepo',
    'icon': null,
  },
  {
    'label': 'd',
    'content': 'Silencer',
    'icon': null,
  },
];

class AnswerArea extends StatelessWidget {
  const AnswerArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: answers
              .map((answer) => AnswerItem(
                    label: answer['label'],
                    content: answer['content'],
                    icon: answer['icon'],
                    state: answer['label'] == 'a'
                        ? AnswerItemState.disabled
                        : answer['label'] == 'b'
                            ? AnswerItemState.selected
                            : answer['label'] == 'c'
                                ? AnswerItemState.correct
                                : AnswerItemState.incorrect,
                  ))
              .toList()),
    );
  }
}

enum AnswerItemState {
  active,
  selected,
  correct,
  incorrect,
  disabled,
}

class AnswerItem extends StatelessWidget {
  const AnswerItem({
    Key? key,
    required this.label,
    required this.content,
    required this.icon,
    required this.state,
  }) : super(key: key);

  final String label;
  final String content;
  final String? icon;
  final AnswerItemState state;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - (16 * 2 - 8);
    final height = MediaQuery.of(context).size.height * 0.12;

    BoxDecoration decor;

    if (state == AnswerItemState.active) {
      decor = _activeAnswerDecor(context);
    } else if (state == AnswerItemState.disabled) {
      decor = _disableAnswerDecor(context);
    } else if (state == AnswerItemState.selected) {
      decor = _selectedAnswerDecor(context);
    } else if (state == AnswerItemState.correct) {
      decor = _correctAnswerDecor(context);
    } else if (state == AnswerItemState.incorrect) {
      decor = _incorrectAnswerDecor(context);
    } else {
      decor = const BoxDecoration();
    }

    return GestureDetector(
      onTap: () {
        log('$runtimeType : selected : $label');
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: width,
        height: height,
        decoration: decor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: SizedBox(
                width: double.infinity,
                child: Opacity(
                  opacity: 1,
                  child: Text(
                    label.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _activeAnswerDecor(BuildContext context) => BoxDecoration(
      border: Border.all(
        color: Colors.white10,
        width: 1.5,
      ),
      color: Theme.of(context)
          .primaryColor
          .withBlue(110)
          .withRed(10)
          .withGreen(65)
          .withOpacity(0.15));

  BoxDecoration _disableAnswerDecor(BuildContext context) => BoxDecoration(
        border: Border.all(
          color: Colors.white10,
          width: 1.5,
        ),
        color: Theme.of(context).primaryColor,
      );

  BoxDecoration _selectedAnswerDecor(BuildContext context) => BoxDecoration(
        border: Border.all(
          color: Colors.white10,
          width: 1.5,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context)
                .primaryColor
                .withBlue(50)
                .withRed(50)
                .withGreen(50)
                .withOpacity(0.3),
            Theme.of(context)
                .primaryColor
                .withBlue(110)
                .withRed(35)
                .withGreen(85)
                .withOpacity(0.7),
          ],
        ),
      );

  BoxDecoration _correctAnswerDecor(BuildContext context) => BoxDecoration(
        border: Border.all(
          color: Colors.white10.withOpacity(0.2),
          width: 1.5,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context)
                .primaryColor
                .withBlue(50)
                .withRed(50)
                .withGreen(150)
                .withOpacity(0.3),
            Theme.of(context)
                .primaryColor
                .withBlue(110)
                .withRed(35)
                .withGreen(155)
                .withOpacity(0.7),
          ],
        ),
      );

  BoxDecoration _incorrectAnswerDecor(BuildContext context) => BoxDecoration(
        border: Border.all(
          color: Colors.white10.withOpacity(0.2),
          width: 1.5,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context)
                .primaryColor
                .withBlue(50)
                .withRed(150)
                .withGreen(50)
                .withOpacity(0.3),
            Theme.of(context)
                .primaryColor
                .withBlue(110)
                .withRed(205)
                .withGreen(85)
                .withOpacity(0.7),
          ],
        ),
      );
}
