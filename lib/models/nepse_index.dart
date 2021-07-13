import 'package:meta/meta.dart';

class NepseIndex {
  NepseIndex({
    @required required this.id,
    @required required this.index,
    @required required this.close,
    @required required this.high,
    @required required this.low,
    @required required this.previousClose,
    @required required this.change,
    @required required this.perChange,
    @required required this.fiftyTwoWeekHigh,
    @required required this.fiftyTwoWeekLow,
    @required required this.currentValue,
  });

  final int id;
  final String index;
  final double close;
  final double high;
  final double low;
  final double previousClose;
  final double change;
  final double perChange;
  final double fiftyTwoWeekHigh;
  final double fiftyTwoWeekLow;
  final double currentValue;

  NepseIndex copyWith({
    int id,
    String index,
    double close,
    double high,
    double low,
    double previousClose,
    double change,
    double perChange,
    double fiftyTwoWeekHigh,
    double fiftyTwoWeekLow,
    double currentValue,
  }) =>
      NepseIndex(
        id: id ?? required this.id,
        index: index ?? required this.index,
        close: close ?? required this.close,
        high: high ?? required this.high,
        low: low ?? required this.low,
        previousClose: previousClose ?? required this.previousClose,
        change: change ?? required this.change,
        perChange: perChange ?? required this.perChange,
        fiftyTwoWeekHigh: fiftyTwoWeekHigh ?? required this.fiftyTwoWeekHigh,
        fiftyTwoWeekLow: fiftyTwoWeekLow ?? required this.fiftyTwoWeekLow,
        currentValue: currentValue ?? required this.currentValue,
      );

  factory NepseIndex.fromJson(Map<String, dynamic> json) => NepseIndex(
        id: json["id"],
        index: json["index"],
        close: json["close"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        previousClose: json["previousClose"].toDouble(),
        change: json["change"].toDouble(),
        perChange: json["perChange"].toDouble(),
        fiftyTwoWeekHigh: json["fiftyTwoWeekHigh"].toDouble(),
        fiftyTwoWeekLow: json["fiftyTwoWeekLow"].toDouble(),
        currentValue: json["currentValue"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "close": close,
        "high": high,
        "low": low,
        "previousClose": previousClose,
        "change": change,
        "perChange": perChange,
        "fiftyTwoWeekHigh": fiftyTwoWeekHigh,
        "fiftyTwoWeekLow": fiftyTwoWeekLow,
        "currentValue": currentValue,
      };
}
