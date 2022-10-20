import 'package:flutter/material.dart';

class QuestionArea extends StatelessWidget {
  const QuestionArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'What is the name of this hero?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ),
          Expanded(
            child: Image.network(
              'https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/axe.png',
              width: 150,
            ),
          )
        ],
      ),
    );
  }
}
