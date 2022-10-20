import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dota_2_trivia_app/data/local/ticker.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';

class GameplayCubit extends Cubit<GameplayState> {
  GameplayCubit(this._ticker) : super(const GameplayState());

  final Ticker _ticker;

  final int _duration = 10; // 10 seconds for each question

  StreamSubscription? _streamSubscription;

  final List<Map<String, dynamic>> data = [
    {
      "question": "What is the name of this hero?",
      "image":
          "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/axe.png",
      "answers": [
        {
          "label": "a",
          "content": "Axe",
          "correct": true,
        },
        {
          "label": "b",
          "content": "Anti Mage",
          "correct": false,
        },
        {
          "label": "c",
          "content": "Legion Commander",
          "correct": false,
        },
        {
          "label": "d",
          "content": "Bounty Hunter",
          "correct": false,
        },
      ]
    },
    {
      "question": "What is the name of this hero?",
      "image":
          "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/meepo.png",
      "answers": [
        {
          "label": "a",
          "content": "Axe",
          "correct": false,
        },
        {
          "label": "b",
          "content": "Meepo",
          "correct": true,
        },
        {
          "label": "c",
          "content": "Legion Commander",
          "correct": false,
        },
        {
          "label": "d",
          "content": "Bounty Hunter",
          "correct": false,
        },
      ]
    },
    {
      "question": "What is the name of this hero?",
      "image":
          "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/puck.png",
      "answers": [
        {
          "label": "a",
          "content": "Axe",
          "correct": true,
        },
        {
          "label": "b",
          "content": "Anti Mage",
          "correct": false,
        },
        {
          "label": "c",
          "content": "Puck",
          "correct": true,
        },
        {
          "label": "d",
          "content": "Bounty Hunter",
          "correct": false,
        },
      ]
    },
  ];

  void initData() {
    emit(state.copyWith(
      questions: data,
      activeQuestion: 0,
      answerLocked: false,
    ));
  }

  void initTimer() {
    emit(state.copyWith(
      timer: _duration,
      timesUp: false,
    ));
  }

  void updateAnswer(String label) {
    emit(state.copyWith(selectedAnswer: label));
  }

  void loadingAnswer() async {
    emit(state.copyWith(isLoadingAnswer: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      isLoadingAnswer: false,
      timesUp: false,
    ));

    checkResult();
  }

  void checkResult() {
    var answers = state.questions![state.activeQuestion!]['answers']
        as List<Map<String, dynamic>>;
    var correctAnswer =
        answers.firstWhere((answer) => answer['correct'] == true);
    if (state.selectedAnswer == correctAnswer['label']) {
      emit(state.copyWith(
        correct: true,
        correctAnswerLabel: correctAnswer['label'],
      ));
    } else {
      emit(state.copyWith(
        correct: false,
        correctAnswerLabel: correctAnswer['label'],
      ));
    }
  }

  void startTimer() {
    closeTimer();

    _streamSubscription = _ticker.tick(ticks: _duration).listen((event) {
      if (event > 0) {
        emit(state.copyWith(timer: event));
      } else {
        emit(state.copyWith(timesUp: true));
      }
    });
  }

  void lockAnswers() {
    emit(state.copyWith(answerLocked: true));
  }

  void closeTimer() {
    _streamSubscription?.cancel();
  }
}
