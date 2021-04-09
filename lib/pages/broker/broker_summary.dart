import 'package:flutter/material.dart';
import 'package:stock_companion/models/brokers.model.dart';
import 'package:stock_companion/pages/company/brokers.dart';

class BrokerSummary extends StatefulWidget {
  const BrokerSummary({this.broker});

  final BrokersModel broker;

  @override
  _BrokerSummaryState createState() => _BrokerSummaryState();
}

class _BrokerSummaryState extends State<BrokerSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.broker.memberName,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
