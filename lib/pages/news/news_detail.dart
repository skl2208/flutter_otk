// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_otk/controller/news_con.dart';
import 'package:flutter_otk/model/news_model.dart';
import 'package:flutter_otk/style/mystyle.dart';
import 'package:flutter_otk/utilities/skutility.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class NewsDetail extends StatefulWidget {
  NewsDetail({required this.id, super.key});

  String id;

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  NewsModel newsData = NewsModel();
  String headnews = "";
  String headimageurl = "";
  String content = "";
  String createdate = "";
  String updatedate = "";

  getInformation() async {
    newsData = await NewsService.showNews(widget.id);
    if (newsData.data != null) {
      print(headnews);
      print(headimageurl);
      print(content);

      setState(() {
        headnews = newsData.data!.first.headnews!;
        headimageurl = newsData.data!.first.headimageurl!;
        content = newsData.data!.first.content!;
        createdate = newsData.data!.first.createdate!;
        updatedate = newsData.data!.first.updatedate!;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getInformation();
  }

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
        title: SelectableText(
          headnews,
          style: TextStyle(
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: SizedBox(
          width: screenWidth > 450 ? screenWidth * 0.5 : screenWidth * 1.0,
          height: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(headimageurl),
                  fit: BoxFit.contain,
                ),
                spaceBox(20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SelectionArea(
                    child: HtmlWidget(
                      content,
                      textStyle: MyAppStyle(def_fontsize: 16).normal(),
                    ),
                  ),
                ),
                spaceBox(20.0),
                Divider(),
                Text("ล่าสุดเมื่อ:${MyUtil.convertToThaiDate(updatedate)}")
              ],
            ),
          ),
        ),
      )),
    );
  }
}
