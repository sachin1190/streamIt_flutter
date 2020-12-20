import 'package:flutter/material.dart';
import 'package:stream_it/UI/homePage.dart';
import 'package:stream_it/UI/loginPage.dart';
import 'package:stream_it/UI/splashScreen.dart';
import 'package:stream_it/utilities/appConstants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream It!',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        primaryIconTheme: IconTheme.of(context).copyWith(color: Colors.white),
        iconTheme: IconTheme.of(context).copyWith(color: Colors.white),
        primaryTextTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
            ),
        primaryColor: AppConstants.primaryCol,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
