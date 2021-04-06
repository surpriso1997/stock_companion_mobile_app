import 'package:flutter/foundation.dart';
import 'package:stock_companion/models/company.dart';

class DataRepository {
  static DataRepository _instance = DataRepository._private();

  DataRepository._private();

  factory DataRepository() => _instance;

  ValueNotifier<List<Company>> companiesList = ValueNotifier([]);
}
