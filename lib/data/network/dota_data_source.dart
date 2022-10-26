import 'dart:convert';
import 'dart:developer';

import 'package:dota_2_trivia_app/data/model/hero/heroes_result.dart';
import 'package:http/http.dart' as http;

const baseDataURL =
    'https://raw.githubusercontent.com/odota/dotaconstants/master/build';

class DotaDataSource {
  DotaDataSource(this.client);

  final http.Client client;

  Future<HeroesResult> fetchHeroes() async {
    final response = await client.get(Uri.parse('$baseDataURL/heroes.json'));

    if (response.statusCode != 200) {
      throw FetchHeroesException();
    }

    final rawData = jsonDecode(response.body) as Map<String, dynamic>;
    Map<String, dynamic> data = {"heroes": []};
    rawData.forEach((key, value) {
      (data["heroes"] as List).add(value);
    });

    return HeroesResult.fromJson(data);
  }
}

class FetchHeroesException implements Exception {
  final message = 'Heroes endpoint error';
}
