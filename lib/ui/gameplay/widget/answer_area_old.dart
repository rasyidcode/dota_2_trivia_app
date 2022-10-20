import 'package:dota_2_trivia_app/ui/gameplay/widget/answer_text_item_old.dart';
import 'package:flutter/material.dart';

class AnswerArea extends StatefulWidget {
  const AnswerArea({Key? key}) : super(key: key);

  @override
  State<AnswerArea> createState() => _AnswerAreaState();
}

class _AnswerAreaState extends State<AnswerArea> {
  String _selectedAnswer = '';
  List<Map<String, dynamic>> answers = [
    {"label": "a", "content": "Axe", "correct": true},
    {"label": "b", "content": "Legion Commander", "correct": false},
    {"label": "c", "content": "Anti Mage", "correct": false},
    {"label": "d", "content": "Meepo", "correct": false},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: answers
              .take(2)
              .map(
                (item) => AnswerTextItem(
                  label: (item['label'] as String).toUpperCase(),
                  content: item['content'],
                  status: _selectedAnswer != item['label']
                      ? AnswerStatus.initial
                      : AnswerStatus.selected,
                  onPressed: () {
                    setState(() {
                      _selectedAnswer = item['label'];
                    });
                  },
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: answers.reversed
              .take(2)
              .map(
                (item) => AnswerTextItem(
                  label: (item['label'] as String).toUpperCase(),
                  content: item['content'],
                  status: _selectedAnswer != item['label']
                      ? AnswerStatus.initial
                      : AnswerStatus.selected,
                  onPressed: () {
                    setState(() {
                      _selectedAnswer = item['label'];
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
