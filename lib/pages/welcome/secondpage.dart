// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otk/controller/greeting_con.dart';
import 'package:flutter_otk/controller/news_con.dart';
import 'package:flutter_otk/main.dart';
import 'package:flutter_otk/model/greeting_model.dart';
import 'package:flutter_otk/model/news_model.dart';
import 'package:flutter_otk/pages/news/news_detail.dart';
import 'package:flutter_otk/style/mystyle.dart';
import 'package:flutter_otk/utilities/skutility.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String welcome_th = "";
  String welcome_en = "";
  NewsModel listNews = NewsModel();
  NewsModel listNews2 = NewsModel();
  CarouselSliderController carouselSliderController =
      CarouselSliderController();

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

    if (kDebugMode) {
      print(result2);
    }

    setState(() {
      listNews = result2;
    });
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
      home: Builder(builder: (context) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    //==== Background =====//
                    SizedBox(
                      width: screenWidth,
                      height: 200,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage("images/bg4.png"),
                      ),
                    ),
                    Transform.translate(
                      //===== คำทักทาย ======//
                      offset: Offset(0, 80),
                      child: Center(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.9,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: SelectableText(welcome_en,
                                    style:
                                        MyAppStyle(def_fontsize: 30).title()),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.9,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: SelectableText(
                                  welcome_th,
                                  style: MyAppStyle(def_fontsize: 30).title(),
                                ),
                              ),
                            ),
                            // Text("${screenWidth.toString()} Test"),
                            // spaceBox(20.0),
                            // Container(
                            //     alignment: Alignment.center,
                            //     decoration: BoxDecoration(
                            //         border: Border.all(color: Colors.red.shade200)),
                            //     child: showAllNews(screenWidth)),
                            // listNews.data!.isNotEmpty ? showNews() : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  width: screenWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var e in listNews.data!)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewsDetail(id: e.id.toString()))),
                                  child: Card(
                                    child: SizedBox(
                                        width: screenWidth > 450 ? 400 : 200,
                                        height: screenWidth > 450 ? 250 : 150,
                                        child: Image.network(
                                          e.headimageurl!,
                                          fit: BoxFit.fill,
                                          headers: {
                                            "Access-Control-Allow-Origin": "*"
                                          },
                                        )),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: screenWidth > 450 ? 400 : 200,
                                  child: SelectableText(
                                    e.headnews.toString(),
                                    maxLines: 3,
                                    style: MyAppStyle(def_fontsize: 16).title(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: screenWidth > 450 ? 400 : 200,
                                  child: SelectableText(
                                    "ล่าสุดเมื่อ: ${MyUtil.convertToThaiDate(e.updatedate.toString())}",
                                    maxLines: 1,
                                    style:
                                        MyAppStyle(def_fontsize: 12).subtitle(),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              )
                            ],
                          ),

                        // Card(
                        //   child: SizedBox(
                        //       width: screenWidth > 450 ? 400 : 200,
                        //       height: screenWidth > 450 ? 250 : 150,
                        //       child: Center(child: Text("B"))),
                        // ),
                        // Card(
                        //   child: SizedBox(
                        //       width: screenWidth > 450 ? 400 : 200,
                        //       height: screenWidth > 450 ? 250 : 150,
                        //       child: Center(child: Text("C"))),
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
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

  Widget showNews() {
    Size size =
        WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
    final d =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
    double screenWidth = size.width / d;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [for (var e in listNews.data!) showEachNews(screenWidth, e)],
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
