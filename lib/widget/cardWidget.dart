import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../dateTimewidget.dart';
import '../main.dart';

class cardWidget extends StatelessWidget {
  const cardWidget({
    Key? key,
    required this.widget,
    required this.widget1,
    required this.tdata,
    required this.widget2,
  }) : super(key: key);

  final Home widget;
  final Home widget1;
  final String tdata;
  final Home widget2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            boxColor,
            boxColor.withOpacity(1),
          ]),
          color: boxColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                child: Text(
                  "Wishing To Know Your Holidays?",
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text("\"Holidays unlocks the fullness of life.\"",
                      style: descriptionStyle),
                ),
              ),
              Text(
                "- Unknown",
                style: descriptionStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dateTimeview(
                      widget: widget,
                      dData: widget.cdate,
                      symbol: "Date: ",
                    ),
                    dateTimeview(
                      dData: tdata,
                      symbol: "Time: ",
                      widget: widget,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
