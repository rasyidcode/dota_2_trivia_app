import 'dart:developer';

import 'package:dota_2_trivia_app/constant/colors.dart';
import 'package:flutter/material.dart';

class EndlessPage extends StatefulWidget {
  const EndlessPage({Key? key}) : super(key: key);

  @override
  State<EndlessPage> createState() => _EndlessPageState();
}

class _EndlessPageState extends State<EndlessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: const [
            TopBar(),
            SizedBox(height: 8.0),
            QuestionArea(imageExist: false),
            AnswerArea(),
            Spacer(),
            TimerArea(),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class TimerArea extends StatelessWidget {
  const TimerArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '00:10',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
              ),
        ),
        Text(
          'TIME REMAINING',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                letterSpacing: 2.0,
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}

const List<Map<String, dynamic>> answers = [
  {
    'label': 'a',
    'content': 'Bloodseeker',
    'icon': null,
  },
  {
    'label': 'b',
    'content': 'Axe',
    'icon': null,
  },
  {
    'label': 'c',
    'content': 'Meepo',
    'icon': null,
  },
  {
    'label': 'd',
    'content': 'Silencer',
    'icon': null,
  },
];

class AnswerArea extends StatelessWidget {
  const AnswerArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: answers
              .map((answer) => AnswerItem(
                    label: answer['label'],
                    content: answer['content'],
                    icon: answer['icon'],
                  ))
              .toList()),
    );
  }
}

class AnswerItem extends StatelessWidget {
  const AnswerItem({
    Key? key,
    required this.label,
    required this.content,
    required this.icon,
  }) : super(key: key);

  final String label;
  final String content;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - (16 * 2 - 8);
    final height = MediaQuery.of(context).size.height * 0.12;

    return GestureDetector(
      onTap: () {
        log('$runtimeType : selected : $label');
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white10, width: 1.5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withBlue(80)
            ],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: SizedBox(
                width: double.infinity,
                child: Opacity(
                  opacity: 1,
                  child: Text(
                    label.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                content,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: kBlueDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              log('$runtimeType : back tapped');
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, size: 15.0),
                const SizedBox(width: 4.0),
                Text(
                  'BACK',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                )
              ],
            ),
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'POINTS:\t\t\t',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                TextSpan(
                  text: '1000',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
