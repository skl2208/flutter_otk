// ignore_for_file: prefer_collection_literals

class News {
  String? id;
  String? title;
  String? headnews;
  String? image;
  String? startdate;
  String? detail;

  News(
      {this.id,
      this.title,
      this.headnews,
      this.image,
      this.startdate,
      this.detail});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    headnews = json['headnews'];
    image = json['image'];
    startdate = json['startdate'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['headnews'] = headnews;
    data['image'] = image;
    data['startdate'] = startdate;
    data['detail'] = detail;
    return data;
  }
}
