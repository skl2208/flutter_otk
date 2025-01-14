// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_otk/pages/welcome/firstpage.dart';
import 'package:flutter_otk/pages/welcome/secondpage.dart';
import 'package:flutter_otk/pages/welcome/thirdpage.dart';

enum statusOnline { online, offline }

List nameMonth = [
  "มกราคม",
  "กุมภาพันธ์",
  "มีนาคม",
  "เมษายน",
  "พฤษภาคม",
  "มิถุนายน",
  "กรกฏาคม",
  "สิงหาคม",
  "กันยายน",
  "ตุลาคม",
  "พฤศจิกายน",
  "ธันวาคม"
];
void main() {
  runApp(MyApp2());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp2(),
    );
  }
}
