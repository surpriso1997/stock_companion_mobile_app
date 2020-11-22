import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/bloc/common_state.dart';
import 'package:stock_companion/bloc/top_trades/gainers.dart';

class Gainers extends StatefulWidget {
  @override
  _GainersState createState() => _GainersState();
}

class _GainersState extends State<Gainers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GainersBloc, CommonState>(builder: (context, state) {
      if (state is FetchingItemsState) {
      } else if (state is ErrorState) {
      } else if (state is NoDataState) {
      } else if (state is RefreshingItems || state is FetchedItemsState) {
      } else
        return Container();
    });
  }
}
