import 'dart:developer';

import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerArea extends StatelessWidget {
  const TimerArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameplayCubit, GameplayState>(
      builder: (context, state) {
        if (state.questions == null) {
          return Container();
        }

        if (state.timer == null) {
          return Container();
        }

        bool? isLoadingAnswer = state.isLoadingAnswer;
        if (isLoadingAnswer != null && isLoadingAnswer) {
          return const CircularProgressIndicator(
            color: Colors.white70,
          );
        }

        bool? correct = state.correct;
        if (correct != null) {
          if (correct) {
            return Column(
              children: [
                Text(
                  'CORRECT',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).primaryColor.withGreen(200),
                      ),
                ),
                Text(
                  '+100 TRIVIA POINTS',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        letterSpacing: 2.0,
                        color: Colors.white70,
                      ),
                ),
              ],
            );
          } else {
            bool? answerLocked = state.answerLocked;
            String? selectedAnswer = state.selectedAnswer;
            if (answerLocked != null) {
              if (answerLocked && selectedAnswer == null) {
                return Text(
                  'NO ANSWER SUBMITTED',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
            }

            return Text(
              'INCORRECT',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).primaryColor.withRed(190),
                  ),
            );
          }
        }

        return Column(
          children: [
            Text(
              '00:${state.timer.toString().padLeft(2, '0')}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'TIME REMAINING',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    letterSpacing: 2.0,
                    color: Colors.white70,
                  ),
            ),
          ],
        );
      },
    );
  }
}
