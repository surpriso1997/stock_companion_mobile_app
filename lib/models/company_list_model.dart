import 'package:meta/meta.dart';

class CompanyListModel {
  CompanyListModel({
    @required required this.id,
    @required required this.companyName,
    @required required this.symbol,
    @required required this.securityName,
    @required required this.status,
    @required required this.companyEmail,
    @required required this.website,
    @required required this.sectorName,
    @required required this.regulatoryBody,
    @required required this.instrumentType,
  });

  final int id;
  final String companyName;
  final String symbol;
  final String securityName;
  final String status;
  final String companyEmail;
  final String website;
  final String sectorName;
  final String regulatoryBody;
  final String instrumentType;

  factory CompanyListModel.fromJson(Map<String, dynamic> json) =>
      CompanyListModel(
        id: json["id"],
        companyName: json["companyName"],
        symbol: json["symbol"],
        securityName: json["securityName"],
        status: json["status"],
        companyEmail: json["companyEmail"],
        website: json["website"],
        sectorName: json["sectorName"],
        regulatoryBody: json["regulatoryBody"],
        instrumentType: json["instrumentType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyName": companyName,
        "symbol": symbol,
        "securityName": securityName,
        "status": status,
        "companyEmail": companyEmail,
        "website": website,
        "sectorName": sectorName,
        "regulatoryBody": regulatoryBody,
        "instrumentType": instrumentType,
      };
}
