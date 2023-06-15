import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_circular_bd/pages/home.dart';

import 'app_style/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BD Jobs Circular',
      theme: ThemeData(
        textTheme: GoogleFonts.loraTextTheme(),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.bg_color,
      ),
      home:HomePage() ,
    );
  }
}
