import 'dart:async';

import 'package:flutter/material.dart';

class TimerArea extends StatefulWidget {
  const TimerArea({Key? key}) : super(key: key);

  @override
  State<TimerArea> createState() => _TimerAreaState();
}

class _TimerAreaState extends State<TimerArea> {
  Timer? _timer;
  int _start = 10;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '00:${_start < 10 ? '0$_start' : '$_start'}',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          'TIME REMAINING',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                letterSpacing: 2.0,
                color: Colors.white70,
              ),
        ),
      ],
    );
  }
}
