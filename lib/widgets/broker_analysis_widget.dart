import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/analysis/broker_analysis_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';

class BrokerAnalysis extends StatefulWidget {
  @override
  _BrokerAnalysisState createState() => _BrokerAnalysisState();
}

class _BrokerAnalysisState extends State<BrokerAnalysis> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerAnalysisBloc, CommonState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
