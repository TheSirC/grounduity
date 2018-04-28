import 'package:flutter/material.dart';

class ResultColumn extends StatelessWidget {
  ResultColumn({Key key, this.title, this.value});
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(40.0),
      child: new Column(
        children: <Widget>[
          new Text(
            title,
            maxLines: 1,
            textScaleFactor: 1.0,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          new Text(
            value,
            maxLines: 1,
            textScaleFactor: 1.75,
          ),
        ],
      ),
    );
  }
}
