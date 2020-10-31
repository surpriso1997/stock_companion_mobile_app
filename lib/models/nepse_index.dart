import 'package:meta/meta.dart';

class NepseIndex {
  NepseIndex({
    @required this.id,
    @required this.index,
    @required this.close,
    @required this.high,
    @required this.low,
    @required this.previousClose,
    @required this.change,
    @required this.perChange,
    @required this.fiftyTwoWeekHigh,
    @required this.fiftyTwoWeekLow,
    @required this.currentValue,
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
        id: id ?? this.id,
        index: index ?? this.index,
        close: close ?? this.close,
        high: high ?? this.high,
        low: low ?? this.low,
        previousClose: previousClose ?? this.previousClose,
        change: change ?? this.change,
        perChange: perChange ?? this.perChange,
        fiftyTwoWeekHigh: fiftyTwoWeekHigh ?? this.fiftyTwoWeekHigh,
        fiftyTwoWeekLow: fiftyTwoWeekLow ?? this.fiftyTwoWeekLow,
        currentValue: currentValue ?? this.currentValue,
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
