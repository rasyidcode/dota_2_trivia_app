import 'package:dota_2_trivia_app/data/local/ticker.dart';
import 'package:dota_2_trivia_app/ui/gameplay/cubit/gameplay_cubit.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer()
    ..registerInstance(Ticker())
    ..registerFactory((c) => GameplayCubit(c.resolve()));
}
