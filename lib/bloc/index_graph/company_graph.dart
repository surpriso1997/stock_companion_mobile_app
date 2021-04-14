import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_event.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/data/provider/api.dart';
import 'package:stock_companion/models/company_graph_data_model.dart';

class CompanyGraphBloc extends Bloc<CommonEvent, CommonState> {
  CompanyGraphBloc() : super(FetchingItemsState());
  List<CompanyGraphModel> graphData = [];
  @override
  Stream<CommonState> mapEventToState(CommonEvent event) async* {
    if (event is FetchedItemsState) {
      yield FetchingItemsState();
      try {
        final res = await getRequest(url: "https://nots/market/graphdata/131");

        if (res.isNotEmpty) {
          var data = res.map((e) => CompanyGraphModel.fromJson(e)).toList();
          graphData = data;
          yield FetchedItemsState(items: data);
        }
      } catch (e) {
        yield ErrorState(message: "Could not fetch company graph data");
        print(e.toString());
      }
    }
  }
}
