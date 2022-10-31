import 'dart:developer';

import 'package:dota_2_trivia_app/data/database/trivia_database.dart';
import 'package:dota_2_trivia_app/data/network/dota_data_json.dart';

class AppRepository {
  AppRepository(this._dataJson, this._triviaDatabase);

  final DotaDataJson _dataJson;
  final TriviaDatabase _triviaDatabase;

  Future<void> updateLastChecked() async {
    await _triviaDatabase.updateLastChecked();
  }

  Future<DateTime> getLastChecked() async {
    return await _triviaDatabase.getLastDataChecked();
  }

  Future<void> saveLastChecked() async {
    await _triviaDatabase.saveLastChecked();
  }

  Future<void> fetchDotaData() async {
    final heroes = await _dataJson.fetchHeroes();
    await _triviaDatabase.saveHeroes(heroes);

    final heroAbilities = await _dataJson.fetchHeroAbilities();
    await _triviaDatabase.saveHeroAbilities(heroAbilities);

    final abilities = await _dataJson.fetchAbilities();
    await _triviaDatabase.saveAbilities(abilities);

    final items = await _dataJson.fetchItems();
    await _triviaDatabase.saveItems(items);
  }
}
