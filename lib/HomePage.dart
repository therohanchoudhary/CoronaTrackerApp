import 'package:corona_tracker/Screens/IndiaData.dart';
import 'package:flutter/material.dart';
import 'package:corona_tracker/Utilities/constants.dart';
import 'APIObject/api_object.dart';
import 'Webview/corona_info.dart';
import 'Webview/corona_prevention.dart';
import 'Utilities/constants.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<APIObject> futureWorldData;

  @override
  void initState() {
    super.initState();
    futureWorldData = fetchWorldData();
  }

  Future<APIObject> fetchWorldData() async {
    final response = await http.get('https://api.covid19api.com/summary');
    if (response.statusCode == 200) {
      return APIObject.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFEB3B),
          title: Text(
            'Corona Tracker made by Rohan',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IndiaData(),
                    ),
                  );
                },
                child: Text(
                    "Click here to know about India's data",
                    textAlign: TextAlign.center,
                    style: kNumberTextMain4)),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF37474f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  Text('Overall Cases', style: kNumberTextMain),
                  FutureBuilder<APIObject>(
                    future: futureWorldData,
                    builder: (context, snapshot) {
                      var totalConfirmed = snapshot.data.totalConfirmed
                          .toString()
                          .replaceAllMapped(reg, mathFunc);
                      if (snapshot.hasData) {
                        if (totalConfirmed != null) {
                          return Text(totalConfirmed, style: kNumbersMain);
                        }
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}",
                            style: kNumberTextMain);
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF37474f),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text('Recovered', style: kNumberTextMain2),
                        FutureBuilder<APIObject>(
                          future: futureWorldData,
                          builder: (context, snapshot) {
                            var totalRecovered = snapshot.data.totalRecovered
                                .toString()
                                .replaceAllMapped(reg, mathFunc);
                            if (snapshot.hasData) {
                              if (totalRecovered != null) {
                                return Text(totalRecovered,
                                    style: kNumbersMain3);
                              }
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}",
                                  style: kNumberTextMain);
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF37474f),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text('Active', style: kNumberTextMain2),
                      FutureBuilder<APIObject>(
                        future: futureWorldData,
                        builder: (context, snapshot) {
                          var totalDeaths = snapshot.data.totalDeaths;
                          var totalRecovered = snapshot.data.totalRecovered;
                          var totalConfirmed = snapshot.data.totalConfirmed;

                          int totalActive2 =
                              totalConfirmed - totalRecovered - totalDeaths;
                          String totalActive = totalActive2
                              .toString()
                              .replaceAllMapped(reg, mathFunc);

                          if (snapshot.hasData) {
                            if (totalActive != null) {
                              return Text(totalActive, style: kNumbersMain3);
                            }
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}",
                                style: kNumberTextMain);
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF37474f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  Text('Total Deaths', style: kNumberTextMain),
                  FutureBuilder<APIObject>(
                    future: futureWorldData,
                    builder: (context, snapshot) {
                      var totalDeaths = snapshot.data.totalDeaths
                          .toString()
                          .replaceAllMapped(reg, mathFunc);
                      if (snapshot.hasData) {
                        if (totalDeaths != null) {
                          return Text(totalDeaths, style: kNumbersMain);
                        }
                        print(totalDeaths.toString());
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}",
                            style: kNumberTextMain);
                      }
                      print(totalDeaths.toString());
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoronaInfo(),
                  ),
                );
              },
              child: Text("Click here to know more about COVID-19",
                  textAlign: TextAlign.center, style: kNumberTextMain4),
            ),
            SizedBox(height: 15),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoronaPrevention(),
                    ),
                  );
                },
                child: Text(
                    "Click here to know about prevention methods from COVID-19",
                    textAlign: TextAlign.center,
                    style: kNumberTextMain4)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
