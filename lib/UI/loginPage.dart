import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_it/UI/homePage.dart';
import 'package:stream_it/UI/videoPlayer.dart';
import 'package:stream_it/models/user.dart';
import 'package:stream_it/utilities/appConstants.dart';
import 'package:stream_it/utilities/constantFields.dart';
import 'package:stream_it/utilities/apiService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> loginForm = new GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  bool obs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Center(
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.3,
                        0.8
                      ],
                      colors: [
                        Colors.purpleAccent.withOpacity(0.7),
                        Colors.lightBlueAccent.withOpacity(.8)
                      ])),
              child: Form(
                key: loginForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'STREAM IT!',
                        style: TextStyle(
                            color: AppConstants.secondaryCol, fontSize: 24),
                      ),
                    ),
                    getTextFieldLarge(usernameController, 'Username'),
                    getPasswordField(passwordController, () {
                      setState(() {
                        obs = !obs;
                      });
                    }, 'Password', obs),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 150),
                      child: Center(
                        child: RaisedButton(
                          onPressed: () async {
                              Navigator.push(
                                     context,
                                  MaterialPageRoute(
                                        builder: (context) =>
                                            VideoApp()));
                            // if (loginForm.currentState.validate()) {
                            //   Map m = await Api().postService('/login', {
                            //     'userName': usernameController.text,
                            //     'password': passwordController.text
                            //   });
                            //   if (m['code'] == 200) {
                            //     print('token is ${m['data']['accessToken']}');
                            //     SharedPreferences prefs =
                            //         await SharedPreferences.getInstance();
                            //     prefs.setString(
                            //         'token', m['data']['accessToken']);
                            //     prefs.setString('', m['data']['role']);
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 VideoApp()));
                            //   } else
                            //     showSnackBar(m['data']);
                            // }
                          },
                          color: AppConstants.secondaryCol,
                          child: Text('Login'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'OK',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ));
  }
}
