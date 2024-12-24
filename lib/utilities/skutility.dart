import 'package:flutter/foundation.dart';
import 'package:flutter_otk/main.dart';

class MyUtil {
  static String convertToThaiDate(String dateInput) {
    String result = "";
    final splitString = dateInput.split(" ");
    try {
      final part1 = splitString[0].split("-");
      if (part1.length > 1) {
        result =
            "${part1[2]} ${nameMonth[int.parse(part1[1]) - 1]} ${int.parse(part1[0]) + 543}";
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return result;
  }
}
