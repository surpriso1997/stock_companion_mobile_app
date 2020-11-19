import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stock_companion/utils/scaling.dart';
import 'package:stock_companion/utils/utils.dart';

Widget buildFloatingActionButton(
    {@required Function onPressed, BuildContext context}) {
  return CircleAvatar(
    radius: SizeConfig.isTablet ? 25 : 30,
    backgroundColor: Theme.of(context).primaryColor,
    child: IconButton(
      onPressed: () {},
      icon: Icon(
        SimpleLineIcons.refresh,
        color: whiteC,
      ),
    ),
  );
}
