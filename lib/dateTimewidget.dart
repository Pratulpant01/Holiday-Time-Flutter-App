import 'package:flutter/material.dart';

import 'constant/constant.dart';
import 'main.dart';

class dateTimeview extends StatelessWidget {
  const dateTimeview({
    required this.dData,
    required this.symbol,
    required this.widget,
  });

  final Home widget;
  final String symbol;
  final String dData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            symbol,
            style: descriptionStyle.copyWith(
              fontSize: 17,
            ),
          ),
          Text(
            dData,
            style: descriptionStyle.copyWith(
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}
