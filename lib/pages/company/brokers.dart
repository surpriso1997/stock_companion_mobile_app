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
        actions: [Icon(Icons.search, color: whiteC)],
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
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => BrokerSummary(
                                    broker: state.listItems[index],
                                  )),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: blackC),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: blackC.withOpacity(0.3),
                                blurRadius: 1,
                                offset: Offset(5, 5),
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.memberName,
                              style: TextStyle(
                                  color: blackC,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Broker code: " + item.memberCode,
                              style: TextStyle(
                                color: blackC,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Phone no: " + item.authorizedContactPersonNumber,
                              style: TextStyle(
                                color: blackC,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              item.tmsLink,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: blackC,
                                fontSize: 14,
                              ),
                            ),
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
