import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/company/company_bloc.dart';
import 'package:stock_companion/models/company_list_model.dart';
import 'package:stock_companion/pages/company/company_details.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/company_analysis_widget.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class Company extends StatefulWidget {
  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CompanyBloc>(context).add(FetchItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listed Companies"),
      ),
      body: Container(
        child: BlocBuilder<CompanyBloc, CommonState>(
          builder: (context, state) {
            if (state is FetchingItemsState) {
              return progressIndicator();
            } else if (state is ErrorState) {
              return errorWidget(state.message, () {});
            } else if (state is NoDataState) {
              return noDataFound();
            } else if (state is RefreshingItems || state is FetchedItemsState) {
              List<CompanyListModel> _list = state.listItems;
              return ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  var _item = _list[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CompanyAnalysis(
                                    company: _item,
                                    commpanyId: _item.id,
                                  )));
                    },
                    title: Text(
                      _item.securityName,
                      style: TextStyle(color: blackC),
                    ),
                    leading: Text(
                      _item.symbol,
                      style: TextStyle(color: blackC),
                    ),
                    subtitle: Text(""),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
