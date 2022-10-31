import 'package:dota_2_trivia_app/data/database/trivia_database.dart';
// import 'package:dota_2_trivia_app/data/local/ticker_data.dart';
import 'package:dota_2_trivia_app/data/network/dota_data_json.dart';
import 'package:dota_2_trivia_app/data/repository/app_repository.dart';
// import 'package:dota_2_trivia_app/data/repository/question_repository.dart';
// import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:dota_2_trivia_app/ui/splash/cubit/splash_cubit.dart';
import 'package:kiwi/kiwi.dart';
import 'package:http/http.dart' as http;

void initKiwi() {
  KiwiContainer()
    ..registerSingleton((c) => TriviaDatabase())
    ..registerInstance(http.Client())
    // ..registerInstance(TickerData())
    ..registerFactory((c) => DotaDataJson(c.resolve()))
    ..registerFactory((c) => AppRepository(c.resolve(), c.resolve()))
    // ..registerFactory((c) => QuestionRepository(c.resolve()))
    // ..registerFactory((c) => GameplayCubit(c.resolve(), c.resolve()))
    ..registerFactory((c) => SplashCubit(c.resolve()));
}
