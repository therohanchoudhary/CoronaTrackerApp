import 'dart:convert';
import 'package:corona_tracker/APIObject/StateAPIObject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Utilities/constants.dart';

class StateScreen extends StatefulWidget {
  final String state;
  final int stateNumber;

  StateScreen({this.state, this.stateNumber});

  @override
  _StateScreen createState() => _StateScreen();
}

class _StateScreen extends State<StateScreen> {
  Future<StateAPIObject> futureStateData;

  @override
  void initState() {
    super.initState();
    futureStateData = fetchStateData();
  }

  Future<StateAPIObject> fetchStateData() async {
    final response = await http.get(
        'https://api.rootnet.in/covid19-in/stats/latest');
    if (response.statusCode == 200) {
      return StateAPIObject.fromJson(json.decode(response.body), widget.stateNumber);
    } else {
      throw Exception('Failed to load data');
    }
  }

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${widget.state}', style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xFFFFEB3B)),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF37474f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Total Cases', style: kNumberTextMain),
                  SizedBox(width: 10),
                  FutureBuilder<StateAPIObject>(
                    future: futureStateData,
                    builder: (context, snapshot) {
                      var totalConfirmed = snapshot.data.totalConfirmed
                          .toString()
                          .replaceAllMapped(reg, mathFunc);
                      if (snapshot.hasData) {
                        return Text(totalConfirmed, style: kNumbersMain);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}", style: kNumberTextMain);
                      }
                      return Text('Loading');
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF37474f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Recovered', style: kNumberTextMain),
                  SizedBox(width: 10),
                  FutureBuilder<StateAPIObject>(
                    future: futureStateData,
                    builder: (context, snapshot) {
                      var discharged = snapshot.data.discharged
                          .toString()
                          .replaceAllMapped(reg, mathFunc);
                      if (snapshot.hasData) {
                        return Text(discharged, style: kNumbersMain);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}", style: kNumberTextMain);
                      }
                      return Text('Loading');
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF37474f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Active', style: kNumberTextMain),
                  SizedBox(width: 10),
                  FutureBuilder<StateAPIObject>(
                    future: futureStateData,
                    builder: (context, snapshot) {
                      var discharged = snapshot.data.discharged;
                      var confirmed = snapshot.data.totalConfirmed;
                      var deaths = snapshot.data.deaths;
                      var active = (confirmed-discharged-deaths).toString().replaceAllMapped(reg, mathFunc);
                      if (snapshot.hasData) {
                        return Text(active, style: kNumbersMain);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}", style: kNumberTextMain);
                      }
                      return Text('Loading');
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF37474f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Deaths', style: kNumberTextMain),
                  SizedBox(width: 10),
                  FutureBuilder<StateAPIObject>(
                    future: futureStateData,
                    builder: (context, snapshot) {
                      var deaths = snapshot.data.deaths
                          .toString()
                          .replaceAllMapped(reg, mathFunc);
                      if (snapshot.hasData) {
                        return Text(deaths, style: kNumbersMain);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}", style: kNumberTextMain);
                      }
                      return Text('Loading');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}