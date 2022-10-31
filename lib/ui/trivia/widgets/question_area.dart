import 'package:flutter/material.dart';

class QuestionArea extends StatelessWidget {
  const QuestionArea({Key? key, required this.imageExist}) : super(key: key);

  final bool imageExist;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'What is the name of this hero?',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Spacer(),
            !imageExist
                ? Container(
                    width: 150,
                    height: 80,
                    color: Colors.black54,
                    child: const Icon(Icons.help_outline, size: 50.0),
                  )
                : Image.network(
                    'https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/axe.png',
                    width: 150,
                  ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
