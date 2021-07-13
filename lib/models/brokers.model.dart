class BrokersModel {
  int id;
  String activeStatus;
  String memberCode;
  String memberName;
  String authorizedContactPersonNumber;
  String tmsLink;
  String isDealer;

  BrokersModel({
    required this.id,
    required this.activeStatus,
    required this.memberCode,
    required this.memberName,
    required this.authorizedContactPersonNumber,
    required this.tmsLink,
    required this.isDealer,
  });

  factory BrokersModel.fromJson(Map<String, dynamic> json) {
    return BrokersModel(
      id: json['id'],
      activeStatus: json['activeStatus'],
      memberCode: json['memberCode'],
      memberName: json['memberName'],
      authorizedContactPersonNumber: json["authorizedContactPersonNumber"],
      tmsLink: json['memberTMSLinkMapping']['tmsLink'],
      isDealer: json['isDealer'],
    );
  }
}
