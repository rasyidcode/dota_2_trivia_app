import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionArea extends StatelessWidget {
  const QuestionArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameplayCubit, GameplayState>(
      builder: (context, state) {
        List<Map<String, dynamic>>? questions = state.questions;
        if (questions == null) {
          return Container();
        }

        int? activeQuestion = state.activeQuestion;
        if (activeQuestion == null) {
          return Container();
        }

        Map<String, dynamic> currentQuestion = questions[activeQuestion];

        return SizedBox(
          height: 150.0,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  currentQuestion['question'],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ),
              Expanded(
                child: Image.network(
                  currentQuestion['image'],
                  width: 150,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
