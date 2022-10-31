import 'dart:developer';

import 'package:dota_2_trivia_app/data/model/question/question.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({
    Key? key,
    required this.label,
    required this.content,
    this.icon,
  }) : super(key: key);

  final String label;
  final String content;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - (16 * 2 - 8);
    final height = MediaQuery.of(context).size.height * 0.12;

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
            height: height,
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
                    child: Opacity(
                      opacity: qItem.hideLabel ? 0 : 1,
                      child: Text(
                        label.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
                // if (qItem.answerType == 'text')
                //   AnswerContentTextOnly(text: content)
                // else if (qItem.answerType == 'image')
                //   AnswerContentImage(url: content)
                // else if (qItem.answerType == 'text_icon')
                //   AnswerContentTextIcon(text: content, iconURL: icon ?? '')
                // else
                Container(),
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

class AnswerContentTextOnly extends StatelessWidget {
  const AnswerContentTextOnly({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class AnswerContentTextIcon extends StatelessWidget {
  const AnswerContentTextIcon(
      {Key? key, required this.iconURL, required this.text})
      : super(key: key);

  final String iconURL;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(width: 8.0),
          Image.network(iconURL, width: 20.0)
        ],
      ),
    );
  }
}

class AnswerContentImage extends StatelessWidget {
  const AnswerContentImage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        url,
        width: 150,
      ),
    );
  }
}
