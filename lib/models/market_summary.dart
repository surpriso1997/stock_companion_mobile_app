import 'package:meta/meta.dart';

class MarketSummary {
  MarketSummary({
    @required this.detail,
    @required this.value,
  });

  final String detail;
  final double value;

  MarketSummary copyWith({
    String detail,
    double value,
  }) =>
      MarketSummary(
        detail: detail ?? this.detail,
        value: value ?? this.value,
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
