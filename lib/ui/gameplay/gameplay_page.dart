import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/answer_area.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/question_area.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/timer_area.dart';
import 'package:dota_2_trivia_app/ui/gameplay/widget/top_bar.dart';
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
            BlocProvider.of<GameplayCubit>(context).lockAnswers();
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const [
                  TopBar(),
                  Divider(),
                  SizedBox(height: 8.0),
                  QuestionArea(),
                  SizedBox(height: 16.0),
                  AnswerArea(),
                  Spacer(),
                  TimerArea(),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
