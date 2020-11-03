class SubIndex {
  int id;
  String index;
  double change;
  double perChange;
  double currentValue;

  SubIndex(
      {this.id, this.index, this.change, this.perChange, this.currentValue});

  SubIndex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    change = json['change'];
    perChange = json['perChange'];
    currentValue = json['currentValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['index'] = this.index;
    data['change'] = this.change;
    data['perChange'] = this.perChange;
    data['currentValue'] = this.currentValue;
    return data;
  }
}
