class AppConstant {
  static const String baseUrl = "https://hotspot.starrycord.com/";
}

class WS {
  static const String showGreeting =
      "${AppConstant.baseUrl}adminotk/ws/greeting/showgreeting_ws.php";
  static const String showNews =
      "${AppConstant.baseUrl}adminotk/ws/news/showallnews_ws.php";
  static const String showNewsDetail =
      "${AppConstant.baseUrl}adminotk/ws/news/shownews_ws.php";
}
