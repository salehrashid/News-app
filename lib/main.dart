import 'package:flutter/material.dart';
import 'package:news_app/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //buat menghilangkan logo debug di pojok atas kanan emu
      debugShowCheckedModeBanner: false,
      
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
      initialRoute: '/',
      routes: {'/' : (context) => const HomePage()},
    );
  }
}