import 'dart:developer';

import 'package:dota_2_trivia_app/data/model/question/question.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({Key? key, required this.label, required this.content})
      : super(key: key);

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - (16 * 2 - 8);
    return BlocBuilder<GameplayCubit, GameplayState>(
      builder: (context, state) {
        if (state.questions == null) {
          return Container();
        }

        if (state.activeQuestion == null) {
          return Container();
        }

        String? selectedAnswer = state.selectedAnswer;
        bool? correct = state.correct;
        bool? isCorrect;
        bool? answerLocked = state.answerLocked;
        QuestionItem qItem = state.questions![state.activeQuestion!];

        Color secondColor = Theme.of(context).primaryColor;
        String? correctAnswerLabel = state.correctAnswerLabel;

        if (correct == null) {
          if (selectedAnswer == null) {
            secondColor = Theme.of(context).primaryColor.withBlue(80);
          } else if (selectedAnswer == label) {
            secondColor = Theme.of(context)
                .primaryColor
                .withBlue(100)
                .withGreen(50)
                .withRed(20);
          } else {
            Theme.of(context).primaryColor.withBlue(50);
          }
        } else {
          if (correct) {
            if (selectedAnswer == label) {
              secondColor =
                  Theme.of(context).primaryColor.withBlue(80).withGreen(100);
              isCorrect = true;
            } else {
              Theme.of(context).primaryColor.withBlue(50);
            }
          } else {
            if (selectedAnswer == label) {
              secondColor =
                  Theme.of(context).primaryColor.withBlue(80).withRed(100);
              isCorrect = false;
            } else {
              Theme.of(context).primaryColor.withBlue(50);
            }
          }
        }

        if (correctAnswerLabel != null) {
          if (correctAnswerLabel == label) {
            secondColor = Theme.of(context).primaryColor.withGreen(100);
          }
        }

        return GestureDetector(
          onTap: () {
            if (answerLocked != null) {
              if (selectedAnswer == null && !answerLocked) {
                BlocProvider.of<GameplayCubit>(context).updateAnswer(label);
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(5.0),
            width: width,
            height: 90.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white10, width: 1.5),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Theme.of(context).primaryColor, secondColor],
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      label.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                Center(
                    child: (qItem.answerType == 'text')
                        ? Text(
                            content,
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        : Image.network(
                            content,
                            width: 150,
                          )),
                isCorrect == null
                    ? Container()
                    : Positioned(
                        top: 0,
                        right: 0,
                        child: isCorrect
                            ? Icon(
                                Icons.check,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withGreen(100),
                              )
                            : Icon(
                                Icons.close,
                                color:
                                    Theme.of(context).primaryColor.withRed(100),
                              ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
