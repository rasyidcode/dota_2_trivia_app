import 'package:dota_2_trivia_app/data/model/question/question.dart';
import 'package:equatable/equatable.dart';

enum EndlessStatus {
  initial,
  loading,
  failure,
  success,
}

class EndlessState extends Equatable {
  const EndlessState({
    required this.status,
    this.questions,
    this.activeQuestion,
    this.timer,
    this.selectedAnswer,
    this.timesUp,
    this.isLoadingAnswer,
    this.correct,
    this.correctAnswerLabel,
    this.answerLocked,
    this.isLoadingQuestion,
    this.gameOver,
    this.error,
  });

  final EndlessStatus status;
  final List<QuestionItem>? questions;
  final int? activeQuestion;
  final int? timer;
  final String? selectedAnswer;
  final bool? timesUp;
  final bool? isLoadingAnswer;
  final bool? correct;
  final String? correctAnswerLabel;
  final bool? answerLocked;
  final bool? isLoadingQuestion;
  final bool? gameOver;
  final String? error;

  @override
  List<Object?> get props => [
        status,
        questions,
        activeQuestion,
        timer,
        selectedAnswer,
        timesUp,
        isLoadingAnswer,
        correct,
        correctAnswerLabel,
        answerLocked,
        isLoadingQuestion,
        error,
      ];

  EndlessState copyWith({
    EndlessStatus? status,
    List<QuestionItem>? questions,
    int? activeQuestion,
    String? selectedAnswer,
    int? timer,
    bool? timesUp,
    bool? isLoadingAnswer,
    bool? correct,
    String? correctAnswerLabel,
    bool? answerLocked,
    bool? isLoadingQuestion,
    String? error,
  }) {
    return EndlessState(
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
      error: error ?? this.error,
    );
  }
}
