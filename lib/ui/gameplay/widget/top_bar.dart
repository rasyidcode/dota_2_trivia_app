import 'dart:developer';

import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            log('$runtimeType : back button');
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white70,
          ),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'POINTS:\t\t\t',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white70,
                    ),
              ),
              TextSpan(
                text: '1000',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white70,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
