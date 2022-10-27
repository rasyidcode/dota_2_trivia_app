import 'dart:developer';

import 'package:dota_2_trivia_app/constant/colors.dart';
import 'package:flutter/material.dart';

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
          // IconButton(
          //   onPressed: () {
          //     log('$runtimeType : back button');
          //   },
          //   splashRadius: 20,
          //   icon: const Icon(
          //     Icons.arrow_back_ios,
          //     color: Colors.white70,
          //   ),
          // ),
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
