import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoApp extends StatefulWidget {
  // final String url;
  // static const route = "/videoapp";

  // VideoApp({@required this.url});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: isFlipped ? MediaQuery.of(context).size.height : 230,
            child: Stack(
              children: [
                WebView(
                initialUrl:
                    'http://192.168.43.12:8080/stream-it/video-streaming/stream/1',
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (NavigationRequest request) {
                  print('request is $request');
                  if (!request.url.startsWith('')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
              Positioned(
                left: MediaQuery.of(context).size.width - 80,
                top: 160,child: Container(
                height: 30,
                width: 60,
                color: Colors.greenAccent
              ),)
              ] 
            ),
          ),
          !isFlipped
              ? Center(
                  child: RaisedButton(
                  child: Text('Full screen'),
                  onPressed: () {
                    setState(() {
                      isFlipped = true;
                      SystemChrome.setEnabledSystemUIOverlays([]);
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.landscapeRight,
                      ]);
                    });
                  },
                ))
              : Container()
        ],
      ),
      //      Container(
      //       width: MediaQuery.of(context).size.width,
      //       height: 250,
      //       child: WebView(
      //   initialUrl: 'http://192.168.43.12:8080/stream-it/video-streaming/stream/1',
      //   javascriptMode: JavascriptMode.unrestricted,
      //   navigationDelegate: (NavigationRequest request) {
      //     print('request is $request');
      //       if (!request.url.startsWith('')) {
      //         return NavigationDecision.prevent;
      //       }
      //       return NavigationDecision.navigate;
      //   },
      // ),
      //     )
    );
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    super.dispose();
  }
}

// class VideoPlayerDemo extends StatefulWidget {
//   @override
//   _VideoPlayerDemoState createState() => _VideoPlayerDemoState();
// }

// class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
//   VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'http://192.168.43.12:8080/stream-it/video-streaming/stream/1',
//      // videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//     );

// //    _controller.addListener(() {
// //      _controller.seekTo(position)
// //      setState(() {});
// //    });
// //    _controller.setLooping(true);
//     _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(padding: const EdgeInsets.only(top: 20.0)),
//             const Text('With remote mp4'),
//             Container(
//               padding: const EdgeInsets.all(20),
//               child: AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: <Widget>[
//                     VideoPlayer(_controller),
//                     ClosedCaption(text: _controller.value.caption.text),
//                     _ControlsOverlay(controller: _controller),
//                     VideoProgressIndicator(_controller, allowScrubbing: true),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ControlsOverlay extends StatelessWidget {
//   const _ControlsOverlay({Key key, this.controller}) : super(key: key);

//   static const _examplePlaybackRates = [
//     0.25,
//     0.5,
//     1.0,
//     1.5,
//     2.0,
//     3.0,
//     5.0,
//     10.0,
//   ];

//   final VideoPlayerController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//                   color: Colors.black26,
//                   child: Center(
//                     child: Icon(
//                       Icons.play_arrow,
//                       color: Colors.white,
//                       size: 100.0,
//                     ),
//                   ),
//                 ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: PopupMenuButton<double>(
//             initialValue: controller.value.playbackSpeed,
//             tooltip: 'Playback speed',
//             onSelected: (speed) {
//               controller.setPlaybackSpeed(speed);
//             },
//             itemBuilder: (context) {
//               return [
//                 for (final speed in _examplePlaybackRates)
//                   PopupMenuItem(
//                     value: speed,
//                     child: Text('${speed}x'),
//                   )
//               ];
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 // Using less vertical padding as the text is also longer
//                 // horizontally, so it feels like it would need more spacing
//                 // horizontally (matching the aspect ratio of the video).
//                 vertical: 12,
//                 horizontal: 16,
//               ),
//               child: Text('${controller.value.playbackSpeed}x'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
