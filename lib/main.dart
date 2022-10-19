import 'package:dota_2_trivia_app/injection_container.dart';
import 'package:dota_2_trivia_app/ui/gameplay/gameplay_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();
  runApp(const Dota2TriviaApp());
}

class Dota2TriviaApp extends StatelessWidget {
  const Dota2TriviaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF1B2838),
      ),
      home: const GameplayPage(),
    );
  }
}
