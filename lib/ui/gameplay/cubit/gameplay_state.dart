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
    this.gameOver,
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
  final bool? gameOver;

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
      isLoadingAnswer: isLoadingAnswer ?? this.isLoadingAnswer,
      correct: correct ?? this.correct,
      correctAnswerLabel: correctAnswerLabel ?? this.correctAnswerLabel,
      answerLocked: answerLocked ?? this.answerLocked,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  GameplayState resetAndLoadNext({
    int? activeQuestion,
    int? timer,
    bool? answerLocked,
  }) {
    return GameplayState(
      status: status,
      questions: questions,
      activeQuestion: activeQuestion ?? this.activeQuestion,
      timer: timer ?? this.timer,
      timesUp: null,
      isLoadingQuestion: null,
      isLoadingAnswer: null,
      correct: null,
      correctAnswerLabel: null,
      answerLocked: answerLocked ?? this.answerLocked,
      selectedAnswer: null,
    );
  }

  GameplayState gameIsOver() {
    return GameplayState(
      status: status,
      questions: null,
      activeQuestion: null,
      timer: null,
      timesUp: null,
      isLoadingQuestion: null,
      isLoadingAnswer: null,
      correct: null,
      correctAnswerLabel: null,
      answerLocked: null,
      selectedAnswer: null,
      gameOver: true,
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
