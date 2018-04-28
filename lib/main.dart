import 'package:flutter/material.dart';
import 'buttoncolumn.dart';
import 'dart:core';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _billAmount = 0.0;
  int _tipPercentage = 0;
  int _billTotal;
  int _tipTier1 = 10;
  int _tipTier2 = 15;
  int _tipTier3 = 20;
  String _monetarySymbol = "\$";

  final appName = 'Grounduity';

  double calculateTotal(double total, int tip) {
    return (total * (1 + tip / 100)).ceilToDouble();
  }

  String calculateTip(double previousTotal, double newTotal) {
    var result = newTotal - previousTotal;
    return "$result";
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Grounduity',
        theme: new ThemeData(
            primarySwatch: Colors.green, accentColor: Colors.greenAccent),
        home: new Scaffold(
          appBar: new AppBar(
            title: Text(appName),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: new TextField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: new InputDecoration(
                        prefixText: _monetarySymbol,
                        labelText: "Bill before gratuity",
                        labelStyle: TextStyle(fontSize: 25.0),
                        hintText: '10',
                      ),
                      onChanged: (String value) {
                        try {
                          _billAmount = double.parse(value);
                        } catch (exception) {
                          _billAmount = 0.0;
                        }
                      },
                    )),
                new ListBody(
                  children: <Widget>[
                    new ButtonColumn(
                        icon: Icons.attach_money,
                        value: _tipTier1,
                        groupValue: _tipPercentage,
                        onChanged: (int value) {
                          setState(() {
                            _tipPercentage = value;
                          });
                        },
                        label: _tipTier1.toString()),
                    new ButtonColumn(
                        icon: Icons.attach_money,
                        value: _tipTier2,
                        groupValue: _tipPercentage,
                        onChanged: (int value) {
                          setState(() {
                            _tipPercentage = value;
                          });
                        },
                        label: _tipTier2.toString()),
                    new ButtonColumn(
                        icon: Icons.attach_money,
                        value: _tipTier3,
                        groupValue: _tipPercentage,
                        onChanged: (int value) {
                          setState(() {
                            _tipPercentage = value;
                          });
                        },
                        label: _tipTier3.toString())
                  ],
                  mainAxis: Axis.horizontal,
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.all(40.0),
                        child: new Text(
                          _monetarySymbol +
                              calculateTip(_billAmount,
                                  calculateTotal(_billAmount, _tipPercentage)),
                          maxLines: 1,
                          textScaleFactor: 1.75,
                        )),
                    new Container(
                        margin: EdgeInsets.all(40.0),
                        child: new Text(
                          _monetarySymbol +
                              '$calculateTotal(_billAmount, _tipPercentage)',
                          maxLines: 1,
                          textScaleFactor: 1.75,
                        ))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ));
  }
}
