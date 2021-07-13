class SubIndex {
  int id;
  String index;
  double change;
  double perChange;
  double currentValue;

  SubIndex(
      {required this.id, required this.index, required this.change, required this.perChange, required this.currentValue});

  SubIndex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    change = json['change'];
    perChange = json['perChange'];
    currentValue = json['currentValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = required this.id;
    data['index'] = required this.index;
    data['change'] = required this.change;
    data['perChange'] = required this.perChange;
    data['currentValue'] = required this.currentValue;
    return data;
  }
}
