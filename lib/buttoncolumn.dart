import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';
import 'dart:async';

typedef FutureValueChanged = Future<void> Function(BuildContext context);

class ButtonColumn<double> extends StatefulWidget {
  ButtonColumn(
      {Key key,
      @required this.icon,
      @required this.value,
      @required this.groupValue,
      @required this.onChanged,
      @required this.onTierChanged})
      : super(key: key);

  final IconData icon;
  double value;
  final double groupValue;
  final ValueChanged<double> onChanged;
  final FutureValueChanged onTierChanged;
  Color activeColor;

  @override
  _ButtonColumnState<double> createState() => new _ButtonColumnState<double>();
}

class _ButtonColumnState<double> extends State<ButtonColumn<double>> {
  Color _getInactiveColor(ThemeData themeData, bool selected) {
    return selected ? themeData.unselectedWidgetColor : themeData.disabledColor;
  }

  void _handleChanged() {
    widget.onChanged(widget.value);
  }

  Null _handleTierChanged(BuildContext context) {
    widget.onTierChanged(context);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    bool selected = widget.groupValue == widget.value;
    return new GestureDetector(
      onTap: () {
        setState(() {
          _handleChanged();
        });
      },
      onLongPress: () => _handleTierChanged(context),
      child: new Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              child: new Icon(
                widget.icon,
                color: selected
                    ? _getInactiveColor(Theme.of(context), selected)
                    : widget.activeColor ?? Theme.of(context).accentColor,
                size: 40.0,
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(top: 7.0),
              child: new Text(
                widget.value.toString() + '%',
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: selected
                      ? _getInactiveColor(Theme.of(context), selected)
                      : widget.activeColor ?? Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
