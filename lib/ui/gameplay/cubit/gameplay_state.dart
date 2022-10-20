import 'package:equatable/equatable.dart';

enum GameplayStatus {
  initial,
  loading,
  failure,
  success,
}

enum AnswerStatus {
  initial,
  selected,
  correct,
  incorrect,
}

class GameplayState extends Equatable {
  const GameplayState({
    required this.status,
    this.questions,
    this.activeQuestion,
    this.timer,
    // this.questionResult,
    this.selectedAnswer,
    this.timesUp,
    this.isLoadingAnswer,
    this.correct,
    this.correctAnswerLabel,
    this.answerLocked,
    this.isLoadingQuestion,
  });

  final GameplayStatus status;
  final List<Map<String, dynamic>>? questions;
  final int? activeQuestion;
  final int? timer;
  // final List<Question?>? questionResult;
  final String? selectedAnswer;
  final bool? timesUp;
  final bool? isLoadingAnswer;
  final bool? correct;
  final String? correctAnswerLabel;
  final bool? answerLocked;
  final bool? isLoadingQuestion;

  @override
  List<Object?> get props => [
        status,
        questions,
        activeQuestion,
        timer,
        // questionResult,
        selectedAnswer,
        timesUp,
        isLoadingAnswer,
        correct,
        correctAnswerLabel,
        answerLocked,
        isLoadingQuestion,
      ];

  GameplayState copyWith({
    GameplayStatus? status,
    List<Map<String, dynamic>>? questions,
    int? activeQuestion,
    String? selectedAnswer,
    int? timer,
    bool? timesUp,
    bool? isLoadingAnswer,
    bool? correct,
    String? correctAnswerLabel,
    bool? answerLocked,
    bool? isLoadingQuestion,
  }) {
    return GameplayState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      activeQuestion: activeQuestion ?? this.activeQuestion,
      timer: timer ?? this.timer,
      timesUp: timesUp ?? this.timesUp,
      isLoadingQuestion: isLoadingQuestion ?? this.isLoadingQuestion,
      isLoadingAnswer: isLoadingAnswer,
      correct: correct,
      correctAnswerLabel: correctAnswerLabel,
      answerLocked: answerLocked,
      selectedAnswer: selectedAnswer,
    );
  }
}

enum QuestionStatus {
  loading,
  ongoing,
  done,
}

enum QuestionResult {
  correct,
  incorrect,
}

class Question {
  Question({
    required this.answer,
    required this.status,
    required this.result,
  });

  final String? answer;
  final QuestionStatus? status;
  final QuestionResult? result;
}
