import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_appp_new/service/news_service.dart';
import 'package:news_appp_new/views/home_view.dart';

void main() {
 NewsService().getNews();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}