import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_otk/1_constant/app_url.dart';
import 'package:flutter_otk/model/greeting_model.dart';
import 'package:http/http.dart' as http;

class Greeting {
  static Future<GreetingModel> getGreeting() async {
    GreetingModel greeting = GreetingModel();
    final url = "${WS.showGreeting}?status=T";

    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.json,
            receiveTimeout: Duration(seconds: 30),
          ));

      if (response.statusCode == 200) {
        greeting =
            GreetingModel.fromJson(jsonDecode(response.data)); // response.data;
      }
    } catch (e) {
      if (kDebugMode) {
        print("เกิด error $e");
      }
    }

    return greeting;
  }
}
