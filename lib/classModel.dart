import 'package:flutter/material.dart';

class Holiday {
  Holiday(
      {required this.holidayDate,
      required this.holidayDescription,
      required this.holidayName});

  final String holidayName;
  final String holidayDescription;
  final String holidayDate;
//response.holidays[0].date.iso
  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
        holidayDate: json['date']['iso'],
        holidayDescription: json['description'],
        holidayName: json['name']);
  }
}

List<Holiday> holidayList = [];
