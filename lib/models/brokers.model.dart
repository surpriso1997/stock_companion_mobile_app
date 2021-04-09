class BrokersModel {
  int id;
  String activeStatus;
  String memberCode;
  String memberName;
  String authorizedContactPersonNumber;
  String tmsLink;
  String isDealer;

  BrokersModel({
    this.id,
    this.activeStatus,
    this.memberCode,
    this.memberName,
    this.authorizedContactPersonNumber,
    this.tmsLink,
    this.isDealer,
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
