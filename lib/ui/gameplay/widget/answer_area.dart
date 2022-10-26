import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/answer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerArea extends StatelessWidget {
  const AnswerArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameplayCubit, GameplayState>(
      builder: (context, state) {
        if (state.questions == null) {
          return Container();
        }

        if (state.activeQuestion == null) {
          return Container();
        }

        final answers = state.questions![state.activeQuestion!].answers;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: answers
                  .take(2)
                  .map((item) =>
                      AnswerItem(label: item.label, content: item.content))
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: answers
                  .skip(2)
                  .map((item) =>
                      AnswerItem(label: item.label, content: item.content))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
