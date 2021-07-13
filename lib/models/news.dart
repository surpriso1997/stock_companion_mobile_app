class NewsModel {
  var url, date, sn, image, title;

  NewsModel(
      {required this.url,
      required this.date,
      required this.sn,
      required this.image,
      required this.title});

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
