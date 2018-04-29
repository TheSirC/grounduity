import 'package:flutter/material.dart';
import 'buttoncolumn.dart';
import 'resultcolumn.dart';
import 'dart:async';
import 'dart:core';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _billAmount = 0.0;
  double _tipTier1 = 10.0;
  double _tipTier2 = 15.0;
  double _tipTier3 = 20.0;
  double _tipPercentage = 15.0;
  String _monetarySymbol = "\$";

  final appName = 'Grounduity';

  double calculateTotal(double total, double tip) {
    return (total * (1 + tip / 100)).ceilToDouble();
  }

  String calculateTip(double previousTotal, double newTotal) {
    var result = newTotal - previousTotal;
    return result.toStringAsPrecision(3);
  }

  Future<void> _changeTierValue(context, _tipValue) async {
    num _returnValue;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Update tip value'),
          content: new TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: new InputDecoration(
                suffixText: '%',
                labelText: "Percentage value",
                labelStyle: TextStyle(fontSize: 25.0),
                hintText: "10",
              ),
              onChanged: (String value) {
                try {
                  _returnValue = num.parse(value);
                } catch (exception) {
                  _returnValue = 0.0;
                }
              }),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Update'),
              onPressed: () {
                setState(() {
                  _tipValue = _returnValue.toDouble();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                new Row(
                  children: <Widget>[
                    new ButtonColumn(
                        icon: Icons.star_border,
                        value: _tipTier1,
                        groupValue: _tipPercentage,
                        onChanged: (double value) {
                          setState(() {
                            _tipPercentage = value;
                          });
                        },
                        onTierChanged: (context) => _changeTierValue(context,_tipTier1)),
                    new ButtonColumn(
                        icon: Icons.star_half,
                        value: _tipTier2,
                        groupValue: _tipPercentage,
                        onChanged: (double value) {
                          setState(() {
                            _tipPercentage = value;
                          });
                        },
                        onTierChanged: (context) => _changeTierValue(context,_tipTier2)),
                    new ButtonColumn(
                      icon: Icons.star,
                      value: _tipTier3,
                      groupValue: _tipPercentage,
                      onChanged: (double value) {
                        setState(() {
                          _tipPercentage = value;
                        });
                      },
                      onTierChanged: (context) => _changeTierValue(context,_tipTier3),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                new Row(
                  children: <Widget>[
                    ResultColumn(
                        title: "Tip",
                        value: _monetarySymbol +
                            calculateTip(_billAmount,
                                calculateTotal(_billAmount, _tipPercentage))),
                    ResultColumn(
                        title: "Total",
                        value: _monetarySymbol +
                            calculateTotal(_billAmount, _tipPercentage)
                                .toStringAsPrecision(3))
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
