// ignore_for_file: prefer_collection_literals

class NewsModel {
  String? status;
  int? totalRec;
  String? message;
  List<NewsData>? data;

  NewsModel({this.status, this.totalRec, this.message, this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalRec = json['total_rec'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NewsData>[];
      json['data'].forEach((v) {
        data!.add(NewsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['total_rec'] = totalRec;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsData {
  String? id;
  String? headnews;
  String? title;
  String? headimageurl;
  String? headimage;
  String? createdate;
  String? content;
  String? status;

  NewsData(
      {this.id, this.headnews, this.headimageurl, this.headimage, this.status});

  NewsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headnews = json['headnews'];
    title = json['title'];
    headimageurl = json['headimageurl'];
    headimage = json['headimage'];
    createdate = json['createdate'];
    content = json['content'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['headnews'] = headnews;
    data['title'] = title;
    data['headimageurl'] = headimageurl;
    data['headimage'] = headimage;
    data['createdate'] = createdate;
    data['content'] = content;
    data['status'] = status;
    return data;
  }
}
