import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_companion/bloc/market_depth/bloc/market_depth_bloc.dart';

class MarketDepth extends StatefulWidget {
  final int companyId;

  const MarketDepth({this.companyId});

  @override
  _MarketDepthState createState() => _MarketDepthState();
}

class _MarketDepthState extends State<MarketDepth> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.companyId != null) {
      BlocProvider.of<MarketDepthBloc>(context)
          .add(GetMarketDepth(widget.companyId));
    }
  }

  @override
  void dispose() {
    super.dispose();

    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market Depth")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<MarketDepthBloc, MarketDepthState>(
              builder: (context, state) {
                return Column(
                  children: [],
                );
              },
            ),
            TextField(
              controller: _textController,
              onSubmitted: (value) {
                if (value != null) {
                  BlocProvider.of<MarketDepthBloc>(context)
                      .add(GetMarketDepth(1));
                  FocusScope.of(context).unfocus();
                }
              },
              decoration: InputDecoration(
                hintText: "Enter symbol",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
