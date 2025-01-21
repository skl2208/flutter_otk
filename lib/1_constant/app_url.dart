class AppConstant {
  // static const String baseUrl = "https://hotspot.starrycord.com";
  static const String baseUrl = "https://wifi.ortorkor.com/";
  // static const String subfolder = "${AppConstant.baseUrl}/";
  static const String subfolder = "${AppConstant.baseUrl}/welcome/";
}

class WS {
  static const String showGreeting =
      "${AppConstant.subfolder}adminotk/ws/greeting/showgreeting_ws.php";
  static const String showNews =
      "${AppConstant.subfolder}adminotk/ws/news/showallnews_ws.php";
  static const String showNewsDetail =
      "${AppConstant.subfolder}adminotk/ws/news/shownews_ws.php";
}
