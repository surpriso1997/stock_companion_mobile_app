class NewsModel {
  var url, date, sn, image, title;

  NewsModel({this.url, this.date, this.sn, this.image, this.title});

  factory NewsModel.fromJson(Map json) {
    return NewsModel(
      url: json['Link'],
      date: json["Date Published"],
      sn: json['S.No'],
      title: json['Title'],
      image: json['Thumbnail'],
    );
  }
}
