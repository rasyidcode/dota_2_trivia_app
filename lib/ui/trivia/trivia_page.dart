import 'package:dota_2_trivia_app/ui/trivia/cubit/trivia_cubit.dart';
import 'package:dota_2_trivia_app/ui/trivia/widgets/answer_area.dart';
import 'package:dota_2_trivia_app/ui/trivia/widgets/question_area.dart';
import 'package:dota_2_trivia_app/ui/trivia/widgets/timer_area.dart';
import 'package:dota_2_trivia_app/ui/trivia/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class TriviaPage extends StatefulWidget {
  const TriviaPage({Key? key}) : super(key: key);

  @override
  State<TriviaPage> createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  final _triviaCubit = KiwiContainer().resolve<TriviaCubit>();

  @override
  void initState() {
    super.initState();

    _triviaCubit.getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _triviaCubit,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            children: const [
              TopBar(),
              SizedBox(height: 8.0),
              QuestionArea(imageExist: false),
              AnswerArea(),
              Spacer(),
              TimerArea(),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
