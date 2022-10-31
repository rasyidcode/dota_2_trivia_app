import 'package:dota_2_trivia_app/ui/trivia/trivia_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const TriviaPage()));
          },
          child: const Text('Play'),
        ),
      ),
    );
  }
}
