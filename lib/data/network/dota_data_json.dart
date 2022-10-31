import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

const baseDataURL =
    'https://raw.githubusercontent.com/odota/dotaconstants/master/build';

class DotaDataJson {
  DotaDataJson(this.client);

  final http.Client client;

  Future<Map<String, dynamic>> fetchHeroes() async {
    final response = await client.get(Uri.parse('$baseDataURL/heroes.json'));
    if (response.statusCode != 200) {
      throw FetchDataException();
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> fetchHeroAbilities() async {
    final response =
        await client.get(Uri.parse('$baseDataURL/hero_abilities.json'));

    if (response.statusCode != 200) {
      throw FetchDataException();
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> fetchAbilities() async {
    final response = await client.get(Uri.parse('$baseDataURL/abilities.json'));

    if (response.statusCode != 200) {
      throw FetchDataException();
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> fetchItems() async {
    final response = await client.get(Uri.parse('$baseDataURL/items.json'));

    if (response.statusCode != 200) {
      throw FetchDataException();
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}

class FetchDataException implements Exception {
  final message = 'Data error';
}
