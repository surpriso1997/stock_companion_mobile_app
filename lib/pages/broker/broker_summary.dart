import 'package:flutter/material.dart';

class BrokerSummary extends StatefulWidget {
  @override
  _BrokerSummaryState createState() => _BrokerSummaryState();
}

class _BrokerSummaryState extends State<BrokerSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Broker Summary"),
      ),
    );
  }
}
