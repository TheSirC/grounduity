import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

Container buildButtonColumn(IconData icon, String label, Color color) {
  return new Container(
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Container(
          margin: EdgeInsets.only(top: 20.0),
          child: new Icon(icon, color: color),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 7.0),
          child: new Text(
            label + '%',
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  double billAmount = 0.0;
  double tipPercentage = 0.0;
  String monetarySymbol = "\$";
  final appName = 'Grounduity';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            primarySwatch: Colors.green, accentColor: Colors.greenAccent),
        home: new Scaffold(
          appBar: new AppBar(
            title: Text(appName),
          ),
          body: new Align(
            alignment: Alignment(0.5, 0.5),
            child: new Column(children: <Widget>[
              new Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: new InputDecoration(
                      prefixText: monetarySymbol,
                        labelText: "Bill before gratuity", hintText: '10'),
                    onChanged: (String value) {
                      try {
                        billAmount = double.parse(value);
                      } catch (exception) {
                        billAmount = 0.0;
                      }
                    },
                  )),
              new Row(
                children: <Widget>[
                  buildButtonColumn(
                      Icons.attach_money, '10', Color(0xFF388E3C)),
                  buildButtonColumn(
                      Icons.attach_money, '15', Color(0xFF388E3C)),
                  buildButtonColumn(
                      Icons.attach_money, '20', Color(0xFF388E3C)),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              new Row(
                children: <Widget>[
                  new Container(
                      margin: EdgeInsets.all(40.0),
                      child: new Text("Calculated gratuity")),
                  new Container(
                      margin: EdgeInsets.all(40.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: new Text("Total"))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
            ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
          ),
        ));
  }
}
