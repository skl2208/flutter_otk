import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otk/controller/news_con.dart';
import 'package:flutter_otk/main.dart';
import 'package:flutter_otk/model/news_model.dart';
import 'package:flutter_otk/style/mystyle.dart';
import 'package:flutter_otk/utilities/skutility.dart';

class MyApp3 extends StatefulWidget {
  const MyApp3({super.key});

  @override
  State<MyApp3> createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  NewsModel listNews = NewsModel();

  getNews() async {
    final result = await NewsService.showAllNewsOnWeb(statusOnline.online);

    if (kDebugMode) {
      print(result);
    }

    setState(() {
      listNews = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    Size size =
        WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
    final d =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    double screenWidth = size.width / d;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red.shade200),
          ),
          child: showAllNews(screenWidth),
        ),
      )),
    );
  }

  Row showAllNews(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var e in listNews.data!)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: screenWidth > 450 ? 500 : 200,
              child: showEachNews(screenWidth, e),
            ),
          ),
      ],
    );
  }

  Column showEachNews(double screenWidth, NewsData e) {
    return Column(
      children: [
        Card(
          elevation: 8,
          shadowColor: Colors.grey.shade500,
          child: SizedBox(
            width: screenWidth > 450 ? 500 : 200,
            height: screenWidth > 450 ? 280 : 130,
            child: Image.network(
              e.headimageurl!,
              fit: BoxFit.fill,
              headers: {"Access-Control-Allow-Origin": "*"},
            ),
          ),
        ),
        SizedBox(
          width: screenWidth > 450 ? 500 : 200,
          height: screenWidth > 450 ? 280 : 130,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceBox(10),
                SelectableText(
                  e.headnews.toString(),
                  maxLines: 3,
                  style: MyAppStyle(def_fontsize: 16).title(),
                ),
                SelectableText(
                  "ล่าสุดเมื่อ: ${MyUtil.convertToThaiDate(e.updatedate.toString())}",
                  maxLines: 1,
                  style: MyAppStyle(def_fontsize: 12).subtitle(),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
