import 'package:flutter/material.dart';
import 'package:stream_it/UI/videoPlayer.dart';
import 'dart:ui';

import 'package:stream_it/utilities/HeaderWidget.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int selectedPosition = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          overflow: Overflow.visible,
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                HeaderWidget(),
                HeaderWidgetPurp(),
                SizedBox(height: 400),
                Container(
                  width: 300,
                  height: 60,
                  color: Colors.orangeAccent,
                )
              ],
            )),
            Positioned(
                left: 10,
                top: MediaQuery.of(context).size.height - 150,
                child: blurNav(context))
          ],
        ),
      ),
    );
  }
}

Widget blurNav(BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(18.0),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: 80.0,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.grey.shade200.withOpacity(0.2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 2,
              child: Container(
                child: IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlayerDemo()));
                    }),
                width: 60,
                height: 60,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 30,
            ),
          ],
        ),
      ),
    ),
  );
}
