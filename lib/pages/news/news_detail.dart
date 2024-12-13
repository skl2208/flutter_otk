// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_otk/model/news_model.dart';
import 'package:flutter_otk/style/mystyle.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({required this.news, super.key});

  NewsData news = NewsData();
  @override
  Widget build(BuildContext context) {
    Size size =
        WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
    final d =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    double screenWidth = size.width / d;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: SelectableText(news.headnews.toString(),
            style: TextStyle(
                color: Colors.white, overflow: TextOverflow.ellipsis)),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: SizedBox(
          width: screenWidth > 450 ? screenWidth * 0.5 : screenWidth * 1.0,
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage("assets/${news.headimage!}"),
                fit: BoxFit.contain,
              ),
              spaceBox(20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: SelectionArea(
                  child: HtmlWidget(
                    news.content.toString(),
                    textStyle: MyAppStyle(def_fontsize: 16).normal(),
                  ),
                ),
              ),
              spaceBox(20.0),
              Divider()
            ],
          ),
        ),
      )),
    );
  }
}
