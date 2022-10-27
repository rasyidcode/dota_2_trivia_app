import 'dart:developer';

import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoaderArea extends StatelessWidget {
  const LoaderArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameplayCubit, GameplayState>(
      builder: (context, state) {
        bool? showLoading;
        int? activeQuestion;

        if (state.status == GameplayStatus.initial) {
          showLoading = false;
        }

        bool? isLoadingNextQuestion = state.isLoadingQuestion;
        if (isLoadingNextQuestion == null || !isLoadingNextQuestion) {
          showLoading = false;
        } else {
          showLoading = true;
        }

        activeQuestion = state.activeQuestion;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Opacity(
                opacity: showLoading || state.status == GameplayStatus.loading
                    ? 1
                    : 0,
                child: Row(
                  children: [
                    Text(
                      'Loading ${showLoading ? 'next' : ''} question',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(width: 8.0),
                    const SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Text(
                '#${(activeQuestion ?? -1) + 1} of 10',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              )
            ],
          ),
        );
      },
    );
  }
}
