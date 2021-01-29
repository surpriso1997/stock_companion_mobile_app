import 'package:flutter/material.dart';
import 'package:stock_companion/models/company_list_model.dart';

class CompanyDetails extends StatefulWidget {
  final CompanyListModel company;
  const CompanyDetails({this.company});
  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        widget.company.companyName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ));
  }
}
