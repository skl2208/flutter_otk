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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String welcome_th = "";
  String welcome_en = "";
  NewsModel listNews = NewsModel();
  // List<dynamic> listnews = [
  //   {
  //     "id": "0001",
  //     "title": "ข่าวที่ 1",
  //     "headnews": "อ.ต.ก.แถลงข่าวเกี่ยวกับงานวันเกษตรแห่งชาติ",
  //     "headimage": "images/upload/news/ad1.jpg",
  //     "createdate": "5 ธันวาคม 2567",
  //     "content":
  //         "<h3>อ.ต.ก. ร่วมงานวันเกษตรแห่งชาติ ประจำปี 2567 ณ ไร่แม่เหียะ คณะเกษตรศาสตร์ มหาวิทยาลัยเชียงใหม่</h3><p>วันที่ 27 พฤศจิกายน 2567 นายปณิธาน มีไชยโย ผู้อำนวยการองค์การตลาดเพื่อเกษตรกร พร้อมด้วยนางสาวสุชาดา เวสารัชตระกูล รองผู้อำนวยการองค์การตลาดเพื่อเกษตรกร ร่วมพิธีเปิดงานวันเกษตรแห่งชาติ ประจำปี 2567 ณ ไร่แม่เหียะ คณะเกษตรศาสตร์ มหาวิทยาลัยเชียงใหม่ โดยมี ศ.ดร.นฤมล ภิญโญสินวัฒน์ รัฐมนตรีว่าการกระทรวงเกษตรและสหกรณ์ เป็นประธานในพิธี ซึ่งจัดขึ้นภายใต้แนวคิด “สืบสาน รักษา และต่อยอดศาสตร์พระราชา สู่เกษตรทันสมัย ความมั่นคงทางอาหาร และความเป็นกลางทางคาร์บอน เพื่อการพัฒนาที่ยั่งยืน” บนพื้นที่ธรรมชาติกว่า 400 ไร่</p><p>กิจกรรมภายในงาน ประกอบด้วย นิทรรศการเฉลิมพระเกียรติฯ และโครงการอันเนื่องมาจากพระราชดำริ ความรู้ด้านวิชาการและเทคโนโลยี นิทรรศการและนวัตกรรมการเกษตรของหน่วยงานภาครัฐ เอกชน ฯลฯ</p><p>องค์การตลาดเพื่อเกษตรกร (อ.ต.ก.) ได้ร่วมจัดนิทรรศการภายใต้แนวคิด “ความมั่นคงทางด้านอาหาร” ให้ความรู้เชิงวิชาการภาคการเกษตรด้วยโมเดลเศรษฐกิจ (BCG Model) สินค้าเกษตรมูลค่าสูงที่เป็นมิตรกับสิ่งแวดล้อม ส่งเสริมสินค้าเกษตรด้านอาหาร เกษตรปลอดภัย สร้างมูลค่าเพิ่ม เปิดโอกาสทางการค้า การขยายช่องทางด้านตลาดสินค้าเกษตรและอาหารผลักดันสู่ตลาดภายในประเทศและต่างประเทศ โดยงานจัดขึ้นระหว่างวันที่ 27 พฤศจิกายน - 8 ธันวาคม 2567 ณ ไร่แม่เหียะ คณะเกษตรศาสตร์ มหาวิทยาลัยเชียงใหม่</p>",
  //     "status": "T"
  //   },
  //   {
  //     "id": "0002",
  //     "title": "ข่าวที่ 2",
  //     "headnews": "พิธีเปิด ศูนย์แสดงสินค้าคุณภาพสูงจาก อ.ต.ก.",
  //     "headimage": "images/upload/news/ad2.jpg",
  //     "createdate": "6 ธันวาคม 2567",
  //     "content":
  //         "<h3>อ.ต.ก. เปิดศูนย์แสดงสินค้าผลิตภัณฑ์เกษตรคุณภาพสูง เพิ่มช่องทางตลาดและรายได้ให้เกษตรกร</h3><p>วันที่ 22 พฤศจิกายน 2567 นายปณิธาน มีไชยโย ผู้อำนวยการองค์การตลาดเพื่อเกษตร พร้อมด้วยคณะผู้บริหาร ร่วมเปิดงาน “เปิดอาคารศูนย์แสดงสินค้าผลิตภัณฑ์เกษตรคุณภาพสูง โดย อ.ต.ก. ระหว่างวันที่ 22 – 28 พฤศจิกายน 2567 ณ ศูนย์แสดงสินค้าผลิตภัณฑ์เกษตรคุณภาพสูง โดยมี นางสาวอนงค์นาถ จ่าแก้ว เลขานุการรัฐมนตรีว่าการกระทรวงเกษตรและสหกรณ์ ให้เกียรติเป็นประธานในพิธี พร้อมด้วยคณะผู้บริหารสังกัดกระทรวงเกษตรและสหกรณ์เข้าร่วมพิธีเปิดงานดังกล่าว</p><p>องค์การตลาดเพื่อเกษตรกร (อ.ต.ก.) ขอเชิญชวนทุกท่านมา ชอป ชม ชิม ร่วมอุดหนุนสินค้าจากเกษตรกร กลุ่มเกษตรกร วิสาหกิจชุมชน โดยภายในงานพบกับสินค้าเกษตรคุณภาพเกรด Premium มากมาย คัดสรรโดย อ.ต.ก. เป็นสินค้าเหมาะกับผู้บริโภคที่รักสุขภาพทุกท่าน ทั้งสินค้าออแกนิค สินค้าเกษตรอินทรีย์ ความ Healthy ที่เลือกได้ จำนวน กว่า 20 ร้านค้า และอาหารอร่อยๆ น่าทานมากมาย และยังมีกิจกรรม เวิร์กช็อป-สร้างอาชีพ แก่ผู้ที่สนใจทุกวัน ไม่ว่าจะเป็นทุบสีดอกไม้ลงบนผ้า, ผ้าย้อมครามธรรมชาติ, เทียนเจล, เทียนหอม, ถ่ายโอนสีใบไม้ลงผ้า และสร้อยคอ-ที่ห้อยโทรศัพท์จากลูกปัด และพิเศษสุด องค์การตลาดเพื่อเกษตรกร (อ.ต.ก.) จัดใหญ่ ลดราคาไข่ แผงละ 65 บาท จำนวนจำกัด วันละ 200 แผง ตลอดระยะเวลาการจัดงาน และยังมีส่วนลด 100 บาท เมื่อซื้อสินค้า 200 บาทขึ้นไป พร้อมมีรถรับ-ส่ง อำนวยความสะดวกให้แก่ผู้ที่เข้าร่วมงานตลอดการจัดงาน อย่าพลาด 22-28 พฤศจิกายน 2567 เวลา 08.00-20.00 น. เท่านั้น</p>",
  //     "status": "T"
  //   },
  //   {
  //     "id": "0003",
  //     "title": "ข่าวที่ 3",
  //     "headnews":
  //         "อ.ต.ก.แถลงข่าวช่วยเหลือผู้ประสบภัยน้ำท่วม โดยประสานงานกับหน่วยงานอื่น",
  //     "headimage": "images/upload/news/ad3.jpg",
  //     "createdate": "7 ธันวาคม 2567",
  //     "content":
  //         "<h3>ผอ.อ.ต.ก. จัดทีมเฉพาะกิจเปิดจุดโรงครัวเร่งด่วน ผลิตอาหารปรุงสำเร็จช่วยเหลือผู้ประสบอุทกภัย ณ อ.ต.ก.จังหวัดสงขลา</h3><p>จากสถานการณ์ฝนตกหนักในพื้นที่ภาคใต้ตอนล่าง ระหว่างวันที่ 22-30 พ.ย.67 ทำให้เกิดน้ำท่วมฉับพลันและน้ำป่าไหลหลาก เกิดอุทกภัยในพื้นที่ 10 จังหวัด ได้แก่ ชุมพร สุราษฎร์ธานี นครศรีธรรมราช พัทลุง ตรัง สตูล สงขลา ปัตตานี ยะลา และนราธิวาส ส่งผลให้พี่น้องเกษตรกรไทยและประชาชนทั่วไปบางพื้นที่ได้รับความเดือดร้อน ประสบปัญหาขาดแคลนอาหาร น้ำดื่มและสิ่งของจำเป็นนั้น ศ.ดร.นฤมล ภิญโญสินวัฒน์ รัฐมนตรีว่าการกระทรวงเกษตรและสหกรณ์ ได้สั่งการให้หน่วยงานในสังกัดและผู้เกี่ยวข้อง จัดเจ้าหน้าที่ชุดเฉพาะกิจเข้าให้การช่วยเหลือเพื่อเร่งแก้ไขปัญหาในเบื้องต้นอย่างเร่งด่วน</p><p>โดยในวันที่ 30 พฤศจิกายน 2567 นายปณิธาน มีไชยโย ผู้อำนวยการองค์การตลาดเพื่อเกษตรกร ได้สั่งการให้นายอิศรเรศ ชื่นปรีดา ผู้อำนวยการฝ่ายธุรกิจเกษตร (รักษาการ) และนายชาญนุวัฒน์ วิหงษ์ ผู้อำนวยการฝ่ายกิจการภูมิภาค (รักษาการ) ลงพื้นที่ภาคใต้และจัดทีม อ.ต.ก.ภูมิภาคเฉพาะกิจ เปิดจุดโรงครัวเร่งด่วน ผลิตอาหารปรุงสำเร็จเพื่อช่วยเหลือผู้ประสบอุทกภัยและบรรเทาความเดือดร้อนในเบื้องต้น ณ อ.ต.ก.จังหวัดสงขลา</p><p>นอกจากนี้ กระทรวงเกษตรและสหกรณ์ ยังได้เปิด “ศูนย์รับบริจาคเพื่อช่วยเหลือผู้ประสบอุทกภัยภาคใต้ ปี 2567” รับบริจาคสิ่งของจำเป็น อาทิ เครื่องอุปโภคบริโภค อาหารกระป๋องพร้อมทาน ยาสามัญ หรือบริจาคเงินผ่านบัญชีธนาคารกรุงไทย สาขาถนนวิสุทธิกษัตริย์ ประเภทกระแสรายวัน ชื่อบัญชี กระทรวงเกษตรและสหกรณ์เพื่อช่วยเหลือผู้ประสบภัยพิบัติภาคใต้ เลขที่บัญชี 006-0-26077-7</p>",
  //     "status": "T"
  //   },
  //   {
  //     "id": "0004",
  //     "title": "ข่าวที่ 4",
  //     "headnews": "อ.ต.ก.แถลงข่าวเกี่ยวกับงานวันเกษตรแห่งชาติ",
  //     "headimage": "images/upload/news/ad4.jpg",
  //     "createdate": "7 ธันวาคม 2567",
  //     "content":
  //         "............................. .......................................... .................................................. .............................................",
  //     "status": "T"
  //   }
  // ];

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
      items: listNews.data!.map((e) {
        return Builder(builder: (BuildContext context) {
          return InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewsDetail(news: e))),
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
                            image: NetworkImage(
                              "assets/${e.headimage}",
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
                            SelectableText(
                              e.content.toString(),
                              maxLines: 3,
                              style: MyAppStyle(def_fontsize: 16).title(),
                            ),
                            SelectableText(
                              e.createdate.toString(),
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
