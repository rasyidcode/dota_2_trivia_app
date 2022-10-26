import 'package:dota_2_trivia_app/data/local/ticker.dart';
import 'package:dota_2_trivia_app/data/network/dota_data_source.dart';
import 'package:dota_2_trivia_app/data/repository/question_repository.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:kiwi/kiwi.dart';
import 'package:http/http.dart' as http;

void initKiwi() {
  KiwiContainer()
    ..registerInstance(http.Client())
    ..registerInstance(Ticker())
    ..registerFactory((c) => DotaDataSource(c.resolve()))
    ..registerFactory((c) => QuestionRepository(c.resolve()))
    ..registerFactory((c) => GameplayCubit(c.resolve(), c.resolve()));
}
