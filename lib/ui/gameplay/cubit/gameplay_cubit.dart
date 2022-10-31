import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dota_2_trivia_app/data/local/ticker_data.dart';
// import 'package:dota_2_trivia_app/data/network/dota_data_source.dart';
import 'package:dota_2_trivia_app/data/repository/question_repository.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_state.dart';

class GameplayCubit extends Cubit<GameplayState> {
  GameplayCubit(this._ticker, this._questionRepository)
      : super(const GameplayState(status: GameplayStatus.initial));

  final TickerData _ticker;
  final QuestionRepository _questionRepository;

  final int _duration = 10; // 10 seconds for each question

  StreamSubscription? _streamSubscription;

  void initData() async {
    emit(state.copyWith(status: GameplayStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    // try {
    //   final questions = await _questionRepository.fetchQuestions();
    //   emit(state.copyWith(
    //     status: GameplayStatus.success,
    //     questions: questions,
    //     activeQuestion: 0,
    //     answerLocked: false,
    //   ));
    // } on FetchHeroesException catch (e) {
    //   emit(state.copyWith(status: GameplayStatus.failure, error: e.message));
    // } on HeroesEmptyException catch (e) {
    //   emit(state.copyWith(status: GameplayStatus.failure, error: e.message));
    // } on Exception catch (_) {
    //   emit(state.copyWith(
    //       status: GameplayStatus.failure, error: 'Something went wrong'));
    // }
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

  void checkResult() async {
    var answers = state.questions?[state.activeQuestion ?? 0].options;

    var correctAnswer = answers?.firstWhere((answer) => answer.correct == true);
    if (state.selectedAnswer == correctAnswer?.label) {
      emit(state.copyWith(
        correct: true,
        correctAnswerLabel: correctAnswer?.label,
      ));
    } else {
      emit(state.copyWith(
        correct: false,
        correctAnswerLabel: correctAnswer?.label,
      ));
    }

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoadingQuestion: true));
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

  void loadNextQuestion() {
    int nextQuestion = state.activeQuestion! + 1;
    int totalQuestion = state.questions!.length;

    if (nextQuestion < totalQuestion) {
      emit(
        state.resetAndLoadNext(
          activeQuestion: nextQuestion,
          timer: _duration,
          answerLocked: false,
        ),
      );

      startTimer();
    } else {
      emit(state.gameIsOver());
    }
  }
}
