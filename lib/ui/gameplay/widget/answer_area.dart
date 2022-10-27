import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/answer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerArea extends StatelessWidget {
  const AnswerArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<GameplayCubit, GameplayState>(
        builder: (context, state) {
          if (state.questions == null) {
            return Container();
          }

          if (state.activeQuestion == null) {
            return Container();
          }

          final answers = state.questions![state.activeQuestion!].answers;

          return Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: answers
                  .map((answer) => AnswerItem(
                        label: answer.label,
                        content: answer.content,
                        icon: answer.icon,
                      ))
                  .toList());
        },
      ),
    );
  }
}
