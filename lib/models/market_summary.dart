import 'package:meta/meta.dart';

class MarketSummary {
  MarketSummary({
    @required required this.detail,
    @required required this.value,
  });

  final String detail;
  final double value;

  MarketSummary copyWith({
    String detail,
    double value,
  }) =>
      MarketSummary(
        detail: detail ?? required this.detail,
        value: value ?? required this.value,
      );

  factory MarketSummary.fromJson(Map<String, dynamic> json) => MarketSummary(
        detail: json["detail"],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "value": value,
      };
}
