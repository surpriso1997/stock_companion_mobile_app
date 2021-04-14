import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/analysis/company_analysis_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';

class CompanyAnalysis extends StatefulWidget {
  @override
  _CompanyAnalysisState createState() => _CompanyAnalysisState();
}

class _CompanyAnalysisState extends State<CompanyAnalysis> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyAnalysisBloc, CommonState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
