import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holiday_time/classModel.dart';
import 'package:holiday_time/constant/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holiday_time/widget/cardWidget.dart';
import 'package:holiday_time/widget/holidayCard.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'dateTimewidget.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apiKey = "d5b1040948f49e90c7d9dd28399dbdec240c400a";

  Future fetchData() async {
    holidayList = [];
    final response = await http.get(
      Uri.parse(
          "https://calendarific.com/api/v2/holidays?&api_key=${apiKey}&country=IN&year=2022"),
    );
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      var getValues = json.decode(response.body);
      values = getValues['response']['holidays'];
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            holidayList.add(Holiday.fromJson(map));
          }
        }
        setState(() {
          holidayList;
        });
      }
      return holidayList;
    } else {
      throw Exception("Unable to fetch Holidays.");
    }
  }

  String tdata = "";

  void getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime =
        DateFormat("HH:mm:ss").format(DateTime.now());
    setState(() {
      tdata = formattedDateTime;
    });
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) => getTime());
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/navicon.svg"),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "HOLIDAY TIME",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Transform.scale(
                scale: 0.7,
                child: SvgPicture.asset(
                  "assets/searchicon.svg",
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            cardWidget(
              widget: widget,
              widget1: widget,
              tdata: tdata,
              widget2: widget,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: boxDecoration1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        "2022 HOLIDAYS",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: holidayList.length,
                          itemBuilder: (context, index) {
                            return holidayCard(
                                holidayDate: holidayList[index].holidayDate,
                                holidayDescription:
                                    holidayList[index].holidayDescription,
                                holidayName: holidayList[index].holidayName);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
