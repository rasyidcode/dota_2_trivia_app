import 'dart:developer';

import 'package:dota_2_trivia_app/data/model/hero/hero.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TriviaDatabase {
  TriviaDatabase();

  Database? _db;

  Future<void> init() async {
    String path = await getDatabasesPath();
    _db = await openDatabase(
      join(path, 'dota_trivia.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE IF NOT EXISTS appdata (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          last_data_checked INTEGER
        )
      ''');
    await db.execute('''
        CREATE TABLE IF NOT EXISTS heroes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          code TEXT NULL,
          name TEXT NULL,
          primary_attr TEXT NULL,
          attack_type TEXT NULL,
          image_url TEXT NULL,
          icon_url TEXT NULL,
          move_speed INTEGER NULL,
          legs INTEGER NULL
        )
      ''');
    await db.execute('''
        CREATE TABLE IF NOT EXISTS hero_abilities(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          hero TEXT NULL,
          abilities TEXT NULL,
          talents TEXT NULL
        )
      ''');
    await db.execute('''
        CREATE TABLE IF NOT EXISTS abilities (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          code TEXT NULL,
          name TEXT NULL,
          mana_cost TEXT NULL,
          lore TEXT NULL,
          desc TEXT NULL,
          damage_type TEXT NULL,
          cooldown TEXT NULL,
          image_url TEXT NULL
        )
      ''');
    await db.execute('''
        CREATE TABLE IF NOT EXISTS items (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          code TEXT NULL,
          name TEXT NULL,
          cost INTEGER NULL,
          image_url TEXT NULL,
          lore TEXT NULL,
          desc TEXT NULL,
          mana_cost INTEGER NULL,
          cooldown INTEGER NULL
        )
    ''');
    // await db.execute('''
    //     CREATE TABLE IF NOT EXISTS questions (
    //       id INTEGER PRIMARY KEY AUTOINCREMENT,
    //       question TEXT NULL,
    //       image_url TEXT NULL,
    //       answer_type TEXT NULL,
    //       template_id INTEGER NULL
    //     )
    // ''');
    // await db.execute('''
    //     CREATE TABLE IF NOT EXISTS options (
    //       id INTEGER PRIMARY KEY AUTOINCREMENT,
    //       question_id INTEGER NULL,
    //       label TEXT NULL,
    //       content TEXT NULL,
    //       correct INTEGER NULL,
    //       icon_url TEXT NULL
    //     )
    // ''');
  }

  Future<void> updateLastChecked() async {
    await _db?.rawUpdate('UPDATE appdata SET last_data_checked = ?',
        [DateTime.now().millisecondsSinceEpoch]);
  }

  Future<void> saveLastChecked() async {
    await _db?.rawInsert('INSERT INTO appdata(last_data_checked) VALUES(?)',
        [DateTime.now().millisecondsSinceEpoch]);
  }

  Future<DateTime> getLastDataChecked() async {
    final appdata =
        await _db?.rawQuery('SELECT * FROM appdata ORDER BY id DESC LIMIT 1');

    if (appdata == null) {
      throw DatabaseResultNullException();
    }

    if (appdata.isEmpty) {
      throw NoResultFoundException();
    }

    if (appdata.first['last_data_checked'] == null) {
      throw LastDataCheckedNullException();
    }

    return DateTime.fromMillisecondsSinceEpoch(
        appdata.first['last_data_checked'] as int);
  }

  Future<void> saveHeroes(Map<String, dynamic> heroes) async {
    heroes.forEach(
      (_, hero) => _db?.batch().rawInsert(
        '''
        INSERT INTO heroes(
            code, 
            name, 
            primary_attr, 
            attack_type, 
            image_url, 
            icon_url, 
            move_speed, 
            legs) VALUES(?, ?, ?, ?, ?, ?, ?, ?)
        ''',
        [
          hero['name'],
          hero['localized_name'],
          hero['primary_attr'],
          hero['attack_type'],
          hero['img'],
          hero['icon'],
          hero['move_speed'],
          hero['legs'],
        ],
      ),
    );

    await _db?.batch().commit(noResult: true);
  }

  Future<void> saveHeroAbilities(Map<String, dynamic> heroAbilities) async {
    heroAbilities.forEach((hero, ability) {
      String abilities = ((ability['abilities'] ?? []) as List).join(',');
      String talents = '';
      for (var talent in ((ability['talents'] ?? []) as List)) {
        talents += '${talent['name'] ?? ''},${talent['level']}|';
      }
      talents = talents.substring(0, talents.length - 1);

      _db?.batch().rawInsert(
        '''
        INSERT INTO hero_abilities(
            hero, 
            abilities, 
            talents) VALUES(?, ?, ?)
        ''',
        [
          hero,
          abilities,
          talents,
        ],
      );
    });

    await _db?.batch().commit(noResult: true);
  }

  Future<void> saveAbilities(Map<String, dynamic> abilities) async {
    abilities.forEach((key, ability) {
      var mc = ability['mc'];
      String? manaCost = '';
      if (mc is List) {
        manaCost = mc.join(',');
      } else {
        manaCost = mc;
      }

      _db?.batch().rawInsert(
        '''
        INSERT INTO abilities(
            code,
            name,
            mana_cost,
            lore,
            desc,
            damage_type,
            cooldown,
            image_url) VALUES(?, ?, ?, ?, ?, ?, ?, ?)
        ''',
        [
          key,
          ability['dname'],
          manaCost,
          ability['lore'],
          ability['desc'],
          ability['dmg_type'],
          ability['img'],
          ability['img'],
        ],
      );
    });

    await _db?.batch().commit(noResult: true);
  }

  Future<void> saveItems(Map<String, dynamic> items) async {
    items.forEach(
      (key, item) => _db?.batch().rawInsert(
        '''
        INSERT INTO items(
            code, 
            name, 
            cost, 
            image_url,
            lore, 
            desc,
            mana_cost, 
            cooldown) VALUES(?, ?, ?, ?, ?, ?, ?, ?)
        ''',
        [
          key,
          item['dname'],
          item['cost'],
          item['img'],
          item['lore'],
          item['notes'],
          item['mc'] is bool ? null : item['mc'],
          item['cd'] is bool ? null : item['cd'],
        ],
      ),
    );

    await _db?.batch().commit(noResult: true);
  }

  Future<List<HeroItem>> getHeroes() async {
    final heroes = await _db?.rawQuery('SELECT * FROM heroes ORDER BY id ASC');

    if (heroes == null) {
      throw DatabaseResultNullException();
    }

    if (heroes.isEmpty) {
      throw NoResultFoundException();
    }

    return heroes.map((item) => HeroItem.fromJson(item)).toList();
  }

  Future<HeroItem> getHero(int id) async {
    final hero = await _db?.rawQuery('SELECT * FROM heroes WHERE id = ?', [id]);

    if (hero == null) {
      throw DatabaseResultNullException();
    }

    if (hero.isEmpty) {
      throw NoResultFoundException();
    }

    return hero.map((item) => HeroItem.fromJson(item)).toList()[0];
  }
}

class LastDataCheckedNullException implements Exception {
  final message = 'Last data checked is null';
}

class DatabaseResultNullException implements Exception {
  final message = 'Result is null';
}

class NoResultFoundException implements Exception {
  final message = 'No result found';
}
