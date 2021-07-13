import 'package:flutter/material.dart';
import 'package:stock_companion/utils/utils.dart';

class CalculatorRow extends StatelessWidget {
  final String text;
  final String value;

  const CalculatorRow({required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(text, style: TextStyle(color: blackC)),
        ),
        Text(value, style: TextStyle(color: blackC))
      ],
    );
  }
}
