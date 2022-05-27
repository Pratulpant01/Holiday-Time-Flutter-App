import 'package:flutter/material.dart';

import '../constant/constant.dart';

class holidayCard extends StatelessWidget {
  holidayCard(
      {required this.holidayDate,
      required this.holidayDescription,
      required this.holidayName});

  final String holidayName;
  final String holidayDescription;
  final String holidayDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: boxDecoration2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              holidayName,
              style: titleStyle.copyWith(
                color: Color.fromARGB(255, 252, 231, 48),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              holidayDescription,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: descriptionStyle.copyWith(
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 220, 239, 241),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              holidayDate,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: descriptionStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
