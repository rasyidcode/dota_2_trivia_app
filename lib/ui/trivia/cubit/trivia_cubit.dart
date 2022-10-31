import 'package:dota_2_trivia_app/data/repository/trivia_repository.dart';
import 'package:dota_2_trivia_app/ui/trivia/cubit/trivia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaCubit extends Cubit<TriviaState> {
  TriviaCubit(this._triviaRepository)
      : super(const TriviaState(status: TriviaStatus.loading));

  final TriviaRepository _triviaRepository;

  void getQuestion() async {
    await _triviaRepository.getQuestion();
  }
}
