import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/index_graph/company_graph.dart';
import 'package:stock_companion/models/company_list_model.dart';
import 'package:stock_companion/widgets/company_graph.dart';

class CompanyDetails extends StatefulWidget {
  final CompanyListModel company;
  const CompanyDetails({this.company});
  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CompanyGraphBloc>(context).add(FetchItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.company.companyName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            color: Colors.pink,
            child: CmpanyGraph(),
          ),
        ],
      ),
    );
  }
}
