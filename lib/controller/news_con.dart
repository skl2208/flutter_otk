import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_otk/1_constant/app_url.dart';
import 'package:flutter_otk/main.dart';
import 'package:flutter_otk/model/greeting_model.dart';
import 'package:flutter_otk/model/news_model.dart';

class NewsService {
  static Future<NewsModel> showAllNewsOnWeb(statusOnline? status) async {
    NewsModel news = NewsModel();

    String url = "";

    switch (status) {
      case statusOnline.offline:
        "${WS.showNews}?status=F";
        break;
      case statusOnline.online:
        url = "${WS.showNews}?status=T";
        break;
      default:
        url = WS.showNews;
    }

    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.json,
            receiveTimeout: Duration(seconds: 30),
          ));

      if (response.statusCode == 200) {
        news = NewsModel.fromJson(jsonDecode(response.data)); // response.data;
      }
    } catch (e) {
      if (kDebugMode) {
        print("เกิด error $e");
      }
    }

    return news;
  }

  static Future<NewsModel> showNews(String id) async {
    NewsModel newsData = NewsModel();

    final url = "${WS.showNew}?id=$id";

    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.json,
            receiveTimeout: Duration(seconds: 30),
          ));

      if (response.statusCode == 200) {
        newsData =
            NewsModel.fromJson(jsonDecode(response.data)); // response.data;
      }
    } catch (e) {
      if (kDebugMode) {
        print("เกิด error $e");
      }
    }
    return newsData;
  }
}
