// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otk/model/news_model.dart';
import 'package:flutter_otk/news/news_detail.dart';
import 'package:flutter_otk/style/mystyle.dart';
import 'package:get/get.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<dynamic> listnews = [
    {
      "id": "0001",
      "title": "ข่าวที่ 1",
      "headnews": "อ.ต.ก.แถลงข่าวเกี่ยวกับงานวันเกษตรแห่งชาติ",
      "image": "images/upload/news/ad1.jpg",
      "startdate": "5 ธันวาคม 2567",
      "detail":
          "<h3>อ.ต.ก. ร่วมงานวันเกษตรแห่งชาติ ประจำปี 2567 ณ ไร่แม่เหียะ คณะเกษตรศาสตร์ มหาวิทยาลัยเชียงใหม่</h3><p>วันที่ 27 พฤศจิกายน 2567 นายปณิธาน มีไชยโย ผู้อำนวยการองค์การตลาดเพื่อเกษตรกร พร้อมด้วยนางสาวสุชาดา เวสารัชตระกูล รองผู้อำนวยการองค์การตลาดเพื่อเกษตรกร ร่วมพิธีเปิดงานวันเกษตรแห่งชาติ ประจำปี 2567 ณ ไร่แม่เหียะ คณะเกษตรศาสตร์ มหาวิทยาลัยเชียงใหม่ โดยมี ศ.ดร.นฤมล ภิญโญสินวัฒน์ รัฐมนตรีว่าการกระทรวงเกษตรและสหกรณ์ เป็นประธานในพิธี ซึ่งจัดขึ้นภายใต้แนวคิด “สืบสาน รักษา และต่อยอดศาสตร์พระราชา สู่เกษตรทันสมัย ความมั่นคงทางอาหาร และความเป็นกลางทางคาร์บอน เพื่อการพัฒนาที่ยั่งยืน” บนพื้นที่ธรรมชาติกว่า 400 ไร่</p><p>กิจกรรมภายในงาน ประกอบด้วย นิทรรศการเฉลิมพระเกียรติฯ และโครงการอันเนื่องมาจากพระราชดำริ ความรู้ด้านวิชาการและเทคโนโลยี นิทรรศการและนวัตกรรมการเกษตรของหน่วยงานภาครัฐ เอกชน ฯลฯ</p><p>องค์การตลาดเพื่อเกษตรกร (อ.ต.ก.) ได้ร่วมจัดนิทรรศการภายใต้แนวคิด “ความมั่นคงทางด้านอาหาร” ให้ความรู้เชิงวิชาการภาคการเกษตรด้วยโมเดลเศรษฐกิจ (BCG Model) สินค้าเกษตรมูลค่าสูงที่เป็นมิตรกับสิ่งแวดล้อม ส่งเสริมสินค้าเกษตรด้านอาหาร เกษตรปลอดภัย สร้างมูลค่าเพิ่ม เปิดโอกาสทางการค้า การขยายช่องทางด้านตลาดสินค้าเกษตรและอาหารผลักดันสู่ตลาดภายในประเทศและต่างประเทศ โดยงานจัดขึ้นระหว่างวันที่ 27 พฤศจิกายน - 8 ธันวาคม 2567 ณ ไร่แม่เหียะ คณะเกษตรศาสตร์ มหาวิทยาลัยเชียงใหม่</p>"
    },
    {
      "id": "0002",
      "title": "ข่าวที่ 2",
      "headnews": "พิธีเปิด ศูนย์แสดงสินค้าคุณภาพสูงจาก อ.ต.ก.",
      "image": "images/upload/news/ad2.jpg",
      "startdate": "6 ธันวาคม 2567",
      "detail":
          "<h3>อ.ต.ก. เปิดศูนย์แสดงสินค้าผลิตภัณฑ์เกษตรคุณภาพสูง เพิ่มช่องทางตลาดและรายได้ให้เกษตรกร</h3><p>วันที่ 22 พฤศจิกายน 2567 นายปณิธาน มีไชยโย ผู้อำนวยการองค์การตลาดเพื่อเกษตร พร้อมด้วยคณะผู้บริหาร ร่วมเปิดงาน “เปิดอาคารศูนย์แสดงสินค้าผลิตภัณฑ์เกษตรคุณภาพสูง โดย อ.ต.ก. ระหว่างวันที่ 22 – 28 พฤศจิกายน 2567 ณ ศูนย์แสดงสินค้าผลิตภัณฑ์เกษตรคุณภาพสูง โดยมี นางสาวอนงค์นาถ จ่าแก้ว เลขานุการรัฐมนตรีว่าการกระทรวงเกษตรและสหกรณ์ ให้เกียรติเป็นประธานในพิธี พร้อมด้วยคณะผู้บริหารสังกัดกระทรวงเกษตรและสหกรณ์เข้าร่วมพิธีเปิดงานดังกล่าว</p><p>องค์การตลาดเพื่อเกษตรกร (อ.ต.ก.) ขอเชิญชวนทุกท่านมา ชอป ชม ชิม ร่วมอุดหนุนสินค้าจากเกษตรกร กลุ่มเกษตรกร วิสาหกิจชุมชน โดยภายในงานพบกับสินค้าเกษตรคุณภาพเกรด Premium มากมาย คัดสรรโดย อ.ต.ก. เป็นสินค้าเหมาะกับผู้บริโภคที่รักสุขภาพทุกท่าน ทั้งสินค้าออแกนิค สินค้าเกษตรอินทรีย์ ความ Healthy ที่เลือกได้ จำนวน กว่า 20 ร้านค้า และอาหารอร่อยๆ น่าทานมากมาย และยังมีกิจกรรม เวิร์กช็อป-สร้างอาชีพ แก่ผู้ที่สนใจทุกวัน ไม่ว่าจะเป็นทุบสีดอกไม้ลงบนผ้า, ผ้าย้อมครามธรรมชาติ, เทียนเจล, เทียนหอม, ถ่ายโอนสีใบไม้ลงผ้า และสร้อยคอ-ที่ห้อยโทรศัพท์จากลูกปัด และพิเศษสุด องค์การตลาดเพื่อเกษตรกร (อ.ต.ก.) จัดใหญ่ ลดราคาไข่ แผงละ 65 บาท จำนวนจำกัด วันละ 200 แผง ตลอดระยะเวลาการจัดงาน และยังมีส่วนลด 100 บาท เมื่อซื้อสินค้า 200 บาทขึ้นไป พร้อมมีรถรับ-ส่ง อำนวยความสะดวกให้แก่ผู้ที่เข้าร่วมงานตลอดการจัดงาน อย่าพลาด 22-28 พฤศจิกายน 2567 เวลา 08.00-20.00 น. เท่านั้น</p>"
    },
    {
      "id": "0003",
      "title": "ข่าวที่ 3",
      "headnews":
          "อ.ต.ก.แถลงข่าวช่วยเหลือผู้ประสบภัยน้ำท่วม โดยประสานงานกับหน่วยงานอื่น",
      "image": "images/upload/news/ad3.jpg",
      "startdate": "7 ธันวาคม 2567",
      "detail":
          "............................. .......................................... .................................................. ............................................."
    },
    {
      "id": "0004",
      "title": "ข่าวที่ 4",
      "headnews": "อ.ต.ก.แถลงข่าวเกี่ยวกับงานวันเกษตรแห่งชาติ",
      "image": "images/upload/news/ad4.jpg",
      "startdate": "7 ธันวาคม 2567",
      "detail":
          "............................. .......................................... .................................................. ............................................."
    }
  ];

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
                image: AssetImage("images/bg3.png"),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 120),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Welcome to MOF Wifi",
                        style: MyAppStyle(def_fontsize: 30).title()),
                    Text(
                      "ยินดีต้อนรับ",
                      style: MyAppStyle(def_fontsize: 30).title(),
                    ),
                    Text("${screenWidth.toString()} Test"),
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
      items: listnews.map((e) {
        return Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetail(news: News.fromJson(e)))),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      shadowColor: Colors.grey.shade500,
                      child: Container(
                        width: screenWidth > 450 ? 380 : 200,
                        height: screenWidth > 450 ? 200 : 130,
                        child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              e["image"],
                            )),
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
                            Text(
                              e["headnews"].toString(),
                              maxLines: 3,
                              style: MyAppStyle(def_fontsize: 16).title(),
                            ),
                            Text(
                              e["startdate"].toString(),
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
