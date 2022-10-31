import 'package:dota_2_trivia_app/constant/colors.dart';
import 'package:dota_2_trivia_app/data/database/trivia_database.dart';
import 'package:dota_2_trivia_app/injection_container.dart';
import 'package:dota_2_trivia_app/ui/endless/endless_page.dart';
import 'package:dota_2_trivia_app/ui/gameplay/gameplay_page.dart';
import 'package:dota_2_trivia_app/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();

  final triviaDB = KiwiContainer().resolve<TriviaDatabase>();
  await triviaDB.init();

  runApp(const Dota2TriviaApp());
}

class Dota2TriviaApp extends StatelessWidget {
  const Dota2TriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dota 2 Trivia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
      ),
      home: const SplashPage(),
    );
  }
}
