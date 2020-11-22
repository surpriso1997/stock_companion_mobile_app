import 'package:flutter/material.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class TabViewBodyItem extends StatefulWidget {
  @override
  _TabViewBodyItemState createState() => _TabViewBodyItemState();
}

class _TabViewBodyItemState extends State<TabViewBodyItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          buildFloatingActionButton(onPressed: () {}, context: context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(10, (index) {
            return Container(
              child: Row(children: [
                Text('ADBL'),
                Text('200'),
                Text('150'),
                Text('2.1'),
                Text('1.1'),
              ]),
            );
          })),
        ),
      ),
    );
  }
}

class PaddingChild extends StatelessWidget {
  final Widget child;
  final double horizontal;
  final double vertical;
  const PaddingChild({Key key, this.child, this.horizontal, this.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? symmetricHzPadding,
          vertical: vertical ?? 0.0),
      child: child,
    );
  }
}

class TableTitleText extends StatelessWidget {
  final String _text;
  final TextStyle _textStyle;
  final TextAlign _textAlign;
  const TableTitleText(String text, {TextStyle style, TextAlign textAlign})
      : _text = text,
        _textStyle = style,
        _textAlign = textAlign;

  @override
  Widget build(BuildContext context) {
    var headingStyle = Theme.of(context).dataTableTheme.headingTextStyle;
    return Text(
      _text,
      textAlign: _textAlign ?? TextAlign.center,
      style: _textStyle ?? headingStyle,
    );
  }
}
