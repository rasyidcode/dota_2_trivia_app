import 'package:equatable/equatable.dart';

enum TriviaStatus {
  initial,
  loading,
}

class TriviaState extends Equatable {
  const TriviaState({required this.status});

  final TriviaStatus status;

  @override
  List<Object?> get props => [status];
}
