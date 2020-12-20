import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stream_it/UI/homePage.dart';
import 'dart:async';
import 'package:stream_it/utilities/appConstants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainCollapsingToolbar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 200),
            Image.asset('assets/images/logo.png'),
            SizedBox(height: 50),
            Text('Stream Seamlessly!',
                style: TextStyle(fontSize: 24, color: AppConstants.primaryCol)),
          ],
        ),
      ),
    );
  }
}
