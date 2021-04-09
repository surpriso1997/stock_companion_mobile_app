import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/brokers/brokers_bloc.dart';
import 'package:stock_companion/models/brokers.model.dart';
import 'package:stock_companion/pages/broker/broker_summary.dart';
import 'package:stock_companion/utils/utils.dart';
import 'package:stock_companion/widgets/fucntional_widgets.dart';

class Brokers extends StatefulWidget {
  @override
  _BrokersState createState() => _BrokersState();
}

class _BrokersState extends State<Brokers> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BrokersListBloc>(context).add(FetchItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brokers"),
      ),
      body: BlocBuilder<BrokersListBloc, CommonState>(
        builder: (context, state) {
          if (state is FetchingItemsState) {
            return progressIndicator();
          } else if (state is FetchedItemsState || state is RefreshingItems) {
            return ListView.builder(
                itemCount: state.listItems.length,
                itemBuilder: (context, index) {
                  BrokersModel item = state.listItems[index];
                  return Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => BrokerSummary()));
                      },
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: blackC.withOpacity(0.3),
                              blurRadius: 3,
                              offset: Offset(5, 5))
                        ]),
                        child: Column(
                          children: [
                            Text(item.memberName),
                            Text("Broker code: " + item.memberCode),
                            Text("Phone no: " +
                                item.authorizedContactPersonNumber),
                            Text(item.tmsLink),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
