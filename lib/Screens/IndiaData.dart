import 'dart:convert';
import 'package:corona_tracker/Screens/StateScreen.dart';
import 'package:flutter/material.dart';
import 'package:corona_tracker/Utilities/constants.dart';
import 'package:http/http.dart' as http;
import '../APIObject/IndiaAPIObject.dart';

class IndiaData extends StatefulWidget {
  final String state;
  final int stateNumber;

  IndiaData({this.state, this.stateNumber});

  @override
  _IndiaData createState() => _IndiaData();
}

class _IndiaData extends State<IndiaData> {
  Future<IndiaAPIObject> futureIndiaData;

  @override
  void initState() {
    super.initState();
    futureIndiaData = fetchWorldData();
  }

  Future<IndiaAPIObject> fetchWorldData() async {
    final response =
    await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    if (response.statusCode == 200) {
      return IndiaAPIObject.fromJson(json.decode(response.body));
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
        backgroundColor: Colors.yellow,
        title: Text("India's Stats", style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
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
                      FutureBuilder<IndiaAPIObject>(
                        future: futureIndiaData,
                        builder: (context, snapshot) {
                          var activeCasesIndia = snapshot.data.total
                              .toString()
                              .replaceAllMapped(reg, mathFunc);
                          if (snapshot.hasData) {
                            return Text(activeCasesIndia, style: kNumbersMain);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}",
                                style: kNumberTextMain);
                          }
                          return Text('Loading');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                      Text(
                        'Deaths',
                        style: kNumberTextMain,
                      ),
                      FutureBuilder<IndiaAPIObject>(
                        future: futureIndiaData,
                        builder: (context, snapshot) {
                          var deathsIndia = snapshot.data.deathsIndia
                              .toString()
                              .replaceAllMapped(reg, mathFunc);
                          if (snapshot.hasData) {
                            return Text(deathsIndia, style: kNumbersMain);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}",
                                style: kNumberTextMain);
                          }
                          return Text('Loading');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                      Text(
                        'Recovered',
                        style: kNumberTextMain,
                      ),
                      FutureBuilder<IndiaAPIObject>(
                        future: futureIndiaData,
                        builder: (context, snapshot) {
                          var discharged = snapshot.data.discharged
                              .toString()
                              .replaceAllMapped(reg, mathFunc);
                          if (snapshot.hasData) {
                            return Text(discharged, style: kNumbersMain);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}",
                                style: kNumberTextMain);
                          }
                          return Text('Loading');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                      FutureBuilder<IndiaAPIObject>(
                        future: futureIndiaData,
                        builder: (context, snapshot) {
                          var cases = snapshot.data.total;
                          var deaths = snapshot.data.deathsIndia;
                          var recovered = snapshot.data.discharged;

                          var active = (cases - deaths - recovered)
                              .toString()
                              .replaceAllMapped(reg, mathFunc);
                          if (snapshot.hasData) {
                            return Text(active, style: kNumbersMain);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}",
                                style: kNumberTextMain);
                          }
                          return Text('Loading');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text("Scroll below to check your State's stats",
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                StateButton(
                    stateName: 'Andaman and Nicobar Islands', stateNumber: 0),
                StateButton(stateName: 'Andhra Pradesh', stateNumber: 1),
                StateButton(stateName: 'Arunachal Pradesh', stateNumber: 2),
                StateButton(stateName: 'Assam', stateNumber: 3),
                StateButton(stateName: 'Bihar', stateNumber: 4),
                StateButton(stateName: 'Chandigarh', stateNumber: 5),
                StateButton(stateName: 'Chattisgarh', stateNumber: 6),
                StateButton(
                    stateName: 'Dadra and Nagar Haveli and Daman and Diu',
                    stateNumber: 7),
                StateButton(stateName: 'Delhi', stateNumber: 8),
                StateButton(stateName: 'Goa', stateNumber: 9),
                StateButton(stateName: 'Gujarat', stateNumber: 10),
                StateButton(stateName: 'Haryana', stateNumber: 11),
                StateButton(stateName: 'Himachal Pradesh', stateNumber: 12),
                StateButton(stateName: 'Jammu & Kashmir', stateNumber: 13),
                StateButton(stateName: 'Jharkhand', stateNumber: 14),
                StateButton(stateName: 'Karnataka', stateNumber: 15),
                StateButton(stateName: 'Kerala', stateNumber: 16),
                StateButton(stateName: 'Ladakh', stateNumber: 17),
                StateButton(stateName: 'Madhya Pradesh', stateNumber: 18),
                StateButton(stateName: 'Maharashtra', stateNumber: 19),
                StateButton(stateName: 'Manipur', stateNumber: 20),
                StateButton(stateName: 'Meghalaya', stateNumber: 21),
                StateButton(stateName: 'Mizoram', stateNumber: 22),
                StateButton(stateName: 'Nagaland', stateNumber: 23),
                StateButton(stateName: 'Odisha', stateNumber: 24),
                StateButton(stateName: 'Puducherry', stateNumber: 25),
                StateButton(stateName: 'Punjab', stateNumber: 26),
                StateButton(stateName: 'Rajasthan', stateNumber: 27),
                StateButton(stateName: 'Sikkim', stateNumber: 28),
                StateButton(stateName: 'Tamil Nadu', stateNumber: 29),
                StateButton(stateName: 'Telangana', stateNumber: 30),
                StateButton(stateName: 'Tripura', stateNumber: 31),
                StateButton(stateName: 'Uttarakhand', stateNumber: 32),
                StateButton(stateName: 'Uttar Pradesh', stateNumber: 33),
                StateButton(stateName: 'West Bengal', stateNumber: 34),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StateButton extends StatelessWidget {
  final String stateName;
  final int stateNumber;

  StateButton({this.stateName, this.stateNumber});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                StateScreen(state: stateName, stateNumber: stateNumber),
          ),
        );
      },
      child: Text('$stateName',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center),
    );
  }
}