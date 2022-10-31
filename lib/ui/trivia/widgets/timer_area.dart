import 'package:flutter/material.dart';

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
