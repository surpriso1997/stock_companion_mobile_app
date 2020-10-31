import 'package:meta/meta.dart';

class IndexHistory {
  IndexHistory({
    @required this.content,
    @required this.pageable,
    @required this.totalPages,
    @required this.totalElements,
    @required this.last,
    @required this.number,
    @required this.size,
    @required this.numberOfElements,
    @required this.sort,
    @required this.first,
    @required this.empty,
  });

  final List<Content> content;
  final Pageable pageable;
  final int totalPages;
  final int totalElements;
  final bool last;
  final int number;
  final int size;
  final int numberOfElements;
  final Sort sort;
  final bool first;
  final bool empty;

  IndexHistory copyWith({
    List<Content> content,
    Pageable pageable,
    int totalPages,
    int totalElements,
    bool last,
    int number,
    int size,
    int numberOfElements,
    Sort sort,
    bool first,
    bool empty,
  }) =>
      IndexHistory(
        content: content ?? this.content,
        pageable: pageable ?? this.pageable,
        totalPages: totalPages ?? this.totalPages,
        totalElements: totalElements ?? this.totalElements,
        last: last ?? this.last,
        number: number ?? this.number,
        size: size ?? this.size,
        numberOfElements: numberOfElements ?? this.numberOfElements,
        sort: sort ?? this.sort,
        first: first ?? this.first,
        empty: empty ?? this.empty,
      );

  factory IndexHistory.fromJson(Map<String, dynamic> json) => IndexHistory(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
        number: json["number"],
        size: json["size"],
        numberOfElements: json["numberOfElements"],
        sort: Sort.fromJson(json["sort"]),
        first: json["first"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "number": number,
        "size": size,
        "numberOfElements": numberOfElements,
        "sort": sort.toJson(),
        "first": first,
        "empty": empty,
      };
}

class Content {
  Content({
    @required this.id,
    @required this.businessDate,
    @required this.exchangeIndexMaster,
    @required this.closingIndex,
    @required this.openIndex,
    @required this.highIndex,
    @required this.lowIndex,
    @required this.fiftyTwoWeekHigh,
    @required this.fiftyTwoWeekLow,
  });

  final int id;
  final DateTime businessDate;
  final ExchangeIndexMaster exchangeIndexMaster;
  final double closingIndex;
  final double openIndex;
  final double highIndex;
  final double lowIndex;
  final double fiftyTwoWeekHigh;
  final double fiftyTwoWeekLow;

  Content copyWith({
    int id,
    DateTime businessDate,
    ExchangeIndexMaster exchangeIndexMaster,
    double closingIndex,
    double openIndex,
    double highIndex,
    double lowIndex,
    double fiftyTwoWeekHigh,
    double fiftyTwoWeekLow,
  }) =>
      Content(
        id: id ?? this.id,
        businessDate: businessDate ?? this.businessDate,
        exchangeIndexMaster: exchangeIndexMaster ?? this.exchangeIndexMaster,
        closingIndex: closingIndex ?? this.closingIndex,
        openIndex: openIndex ?? this.openIndex,
        highIndex: highIndex ?? this.highIndex,
        lowIndex: lowIndex ?? this.lowIndex,
        fiftyTwoWeekHigh: fiftyTwoWeekHigh ?? this.fiftyTwoWeekHigh,
        fiftyTwoWeekLow: fiftyTwoWeekLow ?? this.fiftyTwoWeekLow,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        businessDate: DateTime.parse(json["businessDate"]),
        exchangeIndexMaster:
            ExchangeIndexMaster.fromJson(json["exchangeIndexMaster"]),
        closingIndex: json["closingIndex"].toDouble(),
        openIndex: json["openIndex"].toDouble(),
        highIndex: json["highIndex"].toDouble(),
        lowIndex: json["lowIndex"].toDouble(),
        fiftyTwoWeekHigh: json["fiftyTwoWeekHigh"].toDouble(),
        fiftyTwoWeekLow: json["fiftyTwoWeekLow"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessDate":
            "${businessDate.year.toString().padLeft(4, '0')}-${businessDate.month.toString().padLeft(2, '0')}-${businessDate.day.toString().padLeft(2, '0')}",
        "exchangeIndexMaster": exchangeIndexMaster.toJson(),
        "closingIndex": closingIndex,
        "openIndex": openIndex,
        "highIndex": highIndex,
        "lowIndex": lowIndex,
        "fiftyTwoWeekHigh": fiftyTwoWeekHigh,
        "fiftyTwoWeekLow": fiftyTwoWeekLow,
      };
}

class ExchangeIndexMaster {
  ExchangeIndexMaster({
    @required this.id,
    @required this.indexCode,
    @required this.indexName,
    @required this.description,
    @required this.sectorMaster,
    @required this.activeStatus,
    @required this.keyIndexFlag,
    @required this.baseYearMarketCapitalization,
  });

  final int id;
  final IndexCode indexCode;
  final IndexName indexName;
  final Description description;
  final SectorMaster sectorMaster;
  final ActiveStatus activeStatus;
  final KeyIndexFlag keyIndexFlag;
  final double baseYearMarketCapitalization;

  ExchangeIndexMaster copyWith({
    int id,
    IndexCode indexCode,
    IndexName indexName,
    Description description,
    SectorMaster sectorMaster,
    ActiveStatus activeStatus,
    KeyIndexFlag keyIndexFlag,
    double baseYearMarketCapitalization,
  }) =>
      ExchangeIndexMaster(
        id: id ?? this.id,
        indexCode: indexCode ?? this.indexCode,
        indexName: indexName ?? this.indexName,
        description: description ?? this.description,
        sectorMaster: sectorMaster ?? this.sectorMaster,
        activeStatus: activeStatus ?? this.activeStatus,
        keyIndexFlag: keyIndexFlag ?? this.keyIndexFlag,
        baseYearMarketCapitalization:
            baseYearMarketCapitalization ?? this.baseYearMarketCapitalization,
      );

  factory ExchangeIndexMaster.fromJson(Map<String, dynamic> json) =>
      ExchangeIndexMaster(
        id: json["id"],
        indexCode: indexCodeValues.map[json["indexCode"]],
        indexName: indexNameValues.map[json["indexName"]],
        description: descriptionValues.map[json["description"]],
        sectorMaster: SectorMaster.fromJson(json["sectorMaster"]),
        activeStatus: activeStatusValues.map[json["activeStatus"]],
        keyIndexFlag: keyIndexFlagValues.map[json["keyIndexFlag"]],
        baseYearMarketCapitalization:
            json["baseYearMarketCapitalization"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "indexCode": indexCodeValues.reverse[indexCode],
        "indexName": indexNameValues.reverse[indexName],
        "description": descriptionValues.reverse[description],
        "sectorMaster": sectorMaster.toJson(),
        "activeStatus": activeStatusValues.reverse[activeStatus],
        "keyIndexFlag": keyIndexFlagValues.reverse[keyIndexFlag],
        "baseYearMarketCapitalization": baseYearMarketCapitalization,
      };
}

enum ActiveStatus { A }

final activeStatusValues = EnumValues({"A": ActiveStatus.A});

enum Description { ALL_MICROFINANCE_COMPANY_INDEX }

final descriptionValues = EnumValues({
  "all microfinance company index": Description.ALL_MICROFINANCE_COMPANY_INDEX
});

enum IndexCode { MICRFININD }

final indexCodeValues = EnumValues({"MICRFININD": IndexCode.MICRFININD});

enum IndexName { MICROFINANCE_INDEX }

final indexNameValues =
    EnumValues({"Microfinance Index": IndexName.MICROFINANCE_INDEX});

enum KeyIndexFlag { N }

final keyIndexFlagValues = EnumValues({"N": KeyIndexFlag.N});

class SectorMaster {
  SectorMaster({
    @required this.id,
    @required this.sectorDescription,
    @required this.activeStatus,
    @required this.regulatoryBody,
  });

  final int id;
  final SectorDescription sectorDescription;
  final ActiveStatus activeStatus;
  final RegulatoryBody regulatoryBody;

  SectorMaster copyWith({
    int id,
    SectorDescription sectorDescription,
    ActiveStatus activeStatus,
    RegulatoryBody regulatoryBody,
  }) =>
      SectorMaster(
        id: id ?? this.id,
        sectorDescription: sectorDescription ?? this.sectorDescription,
        activeStatus: activeStatus ?? this.activeStatus,
        regulatoryBody: regulatoryBody ?? this.regulatoryBody,
      );

  factory SectorMaster.fromJson(Map<String, dynamic> json) => SectorMaster(
        id: json["id"],
        sectorDescription:
            sectorDescriptionValues.map[json["sectorDescription"]],
        activeStatus: activeStatusValues.map[json["activeStatus"]],
        regulatoryBody: regulatoryBodyValues.map[json["regulatoryBody"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sectorDescription": sectorDescriptionValues.reverse[sectorDescription],
        "activeStatus": activeStatusValues.reverse[activeStatus],
        "regulatoryBody": regulatoryBodyValues.reverse[regulatoryBody],
      };
}

enum RegulatoryBody { NEPAL_RASTRA_BANK }

final regulatoryBodyValues =
    EnumValues({"Nepal Rastra Bank": RegulatoryBody.NEPAL_RASTRA_BANK});

enum SectorDescription { MICROFINANCE }

final sectorDescriptionValues =
    EnumValues({"Microfinance": SectorDescription.MICROFINANCE});

class Pageable {
  Pageable({
    @required this.sort,
    @required this.pageSize,
    @required this.pageNumber,
    @required this.offset,
    @required this.paged,
    @required this.unpaged,
  });

  final Sort sort;
  final int pageSize;
  final int pageNumber;
  final int offset;
  final bool paged;
  final bool unpaged;

  Pageable copyWith({
    Sort sort,
    int pageSize,
    int pageNumber,
    int offset,
    bool paged,
    bool unpaged,
  }) =>
      Pageable(
        sort: sort ?? this.sort,
        pageSize: pageSize ?? this.pageSize,
        pageNumber: pageNumber ?? this.pageNumber,
        offset: offset ?? this.offset,
        paged: paged ?? this.paged,
        unpaged: unpaged ?? this.unpaged,
      );

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        offset: json["offset"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "offset": offset,
        "paged": paged,
        "unpaged": unpaged,
      };
}

class Sort {
  Sort({
    @required this.sorted,
    @required this.unsorted,
    @required this.empty,
  });

  final bool sorted;
  final bool unsorted;
  final bool empty;

  Sort copyWith({
    bool sorted,
    bool unsorted,
    bool empty,
  }) =>
      Sort(
        sorted: sorted ?? this.sorted,
        unsorted: unsorted ?? this.unsorted,
        empty: empty ?? this.empty,
      );

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
