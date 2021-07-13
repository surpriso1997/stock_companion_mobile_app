import 'package:flutter/material.dart';
import 'package:stock_companion/utils/utils.dart';

buildTitleRow(List<String> texts) {
  return Row(
      children: List.generate(texts.length, (index) {
    return Padding(
      padding: EdgeInsets.only(
          left: index == 0 ? 12.0 : 0.0,
          right: index == texts.length - 1 ? 12.0 : 0.0),
      child: TableTitleText(
        texts[index],
      ),
    );
  }));
}

class PaddingChild extends StatelessWidget {
  final Widget child;
  final double horizontal;
  final double vertical;
  const PaddingChild(
      {Key key,
      required this.child,
      required this.horizontal,
      required this.vertical})
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
  const TableTitleText(String text,
      {TextStyle style, TextAlign textAlign = TextAlign.left})
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
