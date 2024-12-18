// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otk/controller/greeting_con.dart';
import 'package:flutter_otk/controller/news_con.dart';
import 'package:flutter_otk/main.dart';
import 'package:flutter_otk/model/greeting_model.dart';
import 'package:flutter_otk/model/news_model.dart';
import 'package:flutter_otk/pages/news/news_detail.dart';
import 'package:flutter_otk/style/mystyle.dart';
import 'package:flutter_otk/utilities/skutility.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String welcome_th = "";
  String welcome_en = "";
  NewsModel listNews = NewsModel();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  getInformation() async {
    var result = await Greeting.getGreeting();
    if (result.data!.isNotEmpty) {
      setState(() {
        welcome_en = result.data!.first.welcomeen.toString();
        welcome_th = result.data!.first.welcometh.toString();
      });
    }
  }

  getNews() async {
    var result2 = await NewsService.showAllNewsOnWeb(statusOnline.online);
    if (result2.data!.isNotEmpty) {
      setState(() {
        listNews = result2;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getInformation();
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
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage("assets/images/bg3.png"),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 120),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SelectableText(welcome_en,
                        style: MyAppStyle(def_fontsize: 30).title()),
                    SelectableText(
                      welcome_th,
                      style: MyAppStyle(def_fontsize: 30).title(),
                    ),
                    // Text("${screenWidth.toString()} Test"),
                    spaceBox(20.0),
                    showNews(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showNews() {
    Size size =
        WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
    final d =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    double screenWidth = size.width / d;
    return CarouselSlider(
      items: listNews.data!.map((e) {
        return Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetail(id: e.id.toString()))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Card(
                    elevation: 8,
                    shadowColor: Colors.grey.shade500,
                    child: SizedBox(
                      width: screenWidth > 450 ? 380 : 200,
                      height: screenWidth > 450 ? 200 : 130,
                      child: Image.network(
                        e.headimageurl!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth > 450 ? 380 : 200,
                    height: screenWidth > 450 ? 200 : 130,
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
                            "ล่าสุดเมื่อ: ${MyUtil.convertToThaiDate(e.createdate.toString())}",
                            maxLines: 1,
                            style: MyAppStyle(def_fontsize: 12).subtitle(),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      }).toList(),
      options: CarouselOptions(
          height: screenWidth > 450 ? double.maxFinite : double.maxFinite,
          viewportFraction: screenWidth > 450 ? 0.2 : 0.5,

          // viewportFraction: 0.2,
          animateToClosest: false,
          pageSnapping: false,
          enableInfiniteScroll: false,
          autoPlay: false),
    );
  }
}
