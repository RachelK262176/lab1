import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  int gendervalue, agevalue;
  double result, height, weight;
  String boer, james, hume, peters;
  String bbf, jbf, hbf, pbf;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lean Body Mass (Metric Unit)',
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('Lean Body Mass (Metric Unit)'),
            ),
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child:
                              Text('Gender: ', style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                          child: Radio(
                            value: 1,
                            groupValue: gendervalue,
                            onChanged: (int value) {
                              onChanged(value);
                            },
                          ),
                        ),
                        Container(
                          child: Text('Male'),
                        ),
                        Container(
                          child: Radio(
                            value: 2,
                            groupValue: gendervalue,
                            onChanged: ((int value) {
                              onChanged(value);
                            }),
                          ),
                        ),
                        Container(
                          child: Text('Female'),
                        ),
                      ], //children
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text('Age 14 or younger: ',
                              style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                          child: Radio(
                            value: 1,
                            groupValue: agevalue,
                            onChanged: (int value) {
                              onChanged1(value);
                            },
                          ),
                        ),
                        Container(
                          child: Text('Yes'),
                        ),
                        Container(
                          child: Radio(
                            value: 2,
                            groupValue: agevalue,
                            onChanged: ((int value) {
                              onChanged1(value);
                            }),
                          ),
                        ),
                        Container(
                          child: Text('No'),
                        ),
                      ], //children
                    ),
                    Row(
                      children: [
                        Container(
                          child:
                              Text('Height: ', style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(hintText: 'cm'),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _acontroller,
                            //SizedBox(height: 10)
                          ),
                        ),
                      ], //Children
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          child:
                              Text('Weight: ', style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(hintText: 'kg'),
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: _bcontroller,
                          ),
                        ),
                      ], //Children
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: RaisedButton(
                            child: Text('Caluclate'),
                            onPressed: _calculate,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: RaisedButton(
                            child: Text('Clear'),
                            onPressed: _clear,
                            color: Colors.grey,
                          ),
                        ),
                      ], //Children
                    ),
                    Row(children: [
                      Container(
                          child: Text('Result:',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          color: Colors.green)
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Table(
                              border: TableBorder.all(width: 0.8),
                              children: [
                                TableRow(children: [
                                  Text('Formula',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('Lean Body Mass',
                                      style: TextStyle(fontSize: 15),
                                      textScaleFactor: 1.5),
                                  Text('Body Fat',
                                      style: TextStyle(fontSize: 15),
                                      textScaleFactor: 1.5),
                                ]),
                                TableRow(children: [
                                  Text('Peters(for Children)',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('$peters',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('$pbf',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                ]),
                                TableRow(children: [
                                  Text('Boer',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('$boer',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('$bbf',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                ]),
                                TableRow(children: [
                                  Text('James',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('$james',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('$jbf',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                ]),
                                TableRow(children: [
                                  Text('Hume',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('$hume',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                  Text('$hbf',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textScaleFactor: 1.5),
                                ]),
                              ]),
                        ),
                      ], //children
                    )
                  ],
                ),
              ),
            )));
  }

  void _calculate() {
    height = double.parse(_acontroller.text);
    weight = double.parse(_bcontroller.text);

    setState(() {
      if (gendervalue == 1) {
        if (agevalue == 1) {
          double boer1 = (0.407 * weight) + (0.267 * height) - 19.2;
          double james1 = (1.1 * weight) - (128 * (pow((weight / height), 2)));
          double hume1 = (0.32810 * weight) + (0.33929 * height) - 29.5336;
          double peters1 =
              3.80 * (0.0215 * (pow(weight, 0.6469)) * (pow(height, 0.7236)));

          double bbodyfat = 100 - (boer1 / weight) * 100;
          double jbodyfat = 100 - (james1 / weight) * 100;
          double hbodyfat = 100 - (hume1 / weight) * 100;
          double pbodyfat = 100 - (peters1 / weight) * 100;

          boer = format(boer1);
          james = format(james1);
          hume = format(hume1);
          peters = format(peters1);

          bbf = format1(bbodyfat);
          jbf = format1(jbodyfat);
          hbf = format1(hbodyfat);
          pbf = format1(pbodyfat);
        } else if (agevalue == 2) {
          double boer1 = (0.407 * weight) + (0.267 * height) - 19.2;
          double james1 = (1.1 * weight) - (128 * (pow((weight / height), 2)));
          double hume1 = (0.32810 * weight) + (0.33929 * height) - 29.5336;
          double peters1 = 0;

          double bbodyfat = 100 - (boer1 / weight) * 100;
          double jbodyfat = 100 - (james1 / weight) * 100;
          double hbodyfat = 100 - (hume1 / weight) * 100;
          double pbodyfat = 0;

          boer = format(boer1);
          james = format(james1);
          hume = format(hume1);
          peters = format(peters1);

          bbf = format1(bbodyfat);
          jbf = format1(jbodyfat);
          hbf = format1(hbodyfat);
          pbf = format1(pbodyfat);
        } // else if gender 1,age 2

      } else if (gendervalue == 2) {
        if (agevalue == 1) {
          double boer1 = (0.252 * weight) + (0.473 * height) - 48.3;
          double james1 = (1.07 * weight) - (148 * (pow((weight / height), 2)));
          double hume1 = (0.29569 * weight) + (0.41813 * height) - 43.2933;
          double peters1 =
              3.80 * (0.0215 * (pow(weight, 0.6469)) * (pow(height, 0.7236)));

          double bbodyfat = 100 - (boer1 / weight) * 100;
          double jbodyfat = 100 - (james1 / weight) * 100;
          double hbodyfat = 100 - (hume1 / weight) * 100;
          double pbodyfat = 100 - (peters1 / weight) * 100;

          boer = format(boer1);
          james = format(james1);
          hume = format(hume1);
          peters = format(peters1);

          bbf = format1(bbodyfat);
          jbf = format1(jbodyfat);
          hbf = format1(hbodyfat);
          pbf = format1(pbodyfat);
        } else if (agevalue == 2) {
          double boer1 = (0.252 * weight) + (0.473 * height) - 48.3;
          double james1 = (1.07 * weight) - (148 * (pow((weight / height), 2)));
          double hume1 = (0.29569 * weight) + (0.41813 * height) - 43.2933;
          double peters1 = 0;

          double bbodyfat = 100 - (boer1 / weight) * 100;
          double jbodyfat = 100 - (james1 / weight) * 100;
          double hbodyfat = 100 - (hume1 / weight) * 100;
          double pbodyfat = 0;

          boer = format(boer1);
          james = format(james1);
          hume = format(hume1);
          peters = format(peters1);

          bbf = format1(bbodyfat);
          jbf = format1(jbodyfat);
          hbf = format1(hbodyfat);
          pbf = format1(pbodyfat);
        } // else if age 2
      } //else if gender 2
    });
  } //calculate

  void onChanged(int value) {
    setState(() {
      gendervalue = value;
    });
  }

  void onChanged1(int value) {
    setState(() {
      agevalue = value;
    });
  }

  void _clear() {
    setState(() {
      _acontroller.clear();
      _bcontroller.clear();
      agevalue = 0;
      gendervalue = 0;
    });
  }

  String format(double a) {
    return (a.toStringAsFixed(a.truncateToDouble() == a ? 0 : 1)) + ' kg';
  }

  String format1(double b) {
    return (b.toStringAsFixed(b.truncateToDouble() == b ? 0 : 0)) + ' %';
  }
}
