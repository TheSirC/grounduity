import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ButtonColumn<T> extends StatefulWidget {
  const ButtonColumn(
      {Key key,
      @required this.icon,
      @required this.label,
      @required this.value,
      @required this.groupValue,
      @required this.onChanged})
      : super(key: key);

  final IconData icon;
  final String label;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Color activeColor;

  @override
  _ButtonColumnState<T> createState() => new _ButtonColumnState<T>();
}

class _ButtonColumnState<T> extends State<ButtonColumn<T>>
    with TickerProviderStateMixin {
  bool get _enabled => widget.onChanged != null;

  Color _getInactiveColor(ThemeData themeData) {
    return _enabled ? themeData.unselectedWidgetColor : themeData.disabledColor;
  }

  void _handleChanged(bool selected) {
    if (selected) widget.onChanged(widget.value);
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            margin: EdgeInsets.only(top: 20.0),
            child: new Icon(
              widget.icon,
              color: Theme.of(context).accentColor,
              size: 40.0,
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 7.0),
            child: new Text(
              widget.label + '%',
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
