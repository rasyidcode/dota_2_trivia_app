import 'dart:async';
import 'dart:developer';

import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/answer_area.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/answer_area2.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/timer_area.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/timer_area2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class GameplayPage extends StatefulWidget {
  const GameplayPage({Key? key}) : super(key: key);

  @override
  State<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends State<GameplayPage> {
  final _gameplayCubit = KiwiContainer().resolve<GameplayCubit>();

  @override
  void initState() {
    super.initState();

    _gameplayCubit.initData();
    _gameplayCubit.initTimer();
    _gameplayCubit.startTimer();
  }

  @override
  void dispose() {
    _gameplayCubit.closeTimer();
    _gameplayCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _gameplayCubit,
      child: BlocListener<GameplayCubit, GameplayState>(
        listener: (context, state) {
          bool? timesUp = state.timesUp;

          if (timesUp != null && timesUp) {
            BlocProvider.of<GameplayCubit>(context).closeTimer();
            BlocProvider.of<GameplayCubit>(context).loadingAnswer();
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const TopBar(),
                  const Divider(),
                  const SizedBox(height: 8.0),
                  const QuestionArea(),
                  const SizedBox(height: 16.0),
                  const AnswerArea2(),
                  const Spacer(),
                  const TimerArea2(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionArea extends StatelessWidget {
  const QuestionArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Container(
        // color: Colors.amber,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'What is the name of this hero?',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
              ),
            ),
            Expanded(
              child: Image.network(
                'https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/axe.png',
                width: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            log('$runtimeType : back button');
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white70,
          ),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'POINTS:\t\t\t',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white70,
                    ),
              ),
              TextSpan(
                text: '1000',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white70,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
