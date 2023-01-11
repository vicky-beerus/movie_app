import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../HOME_PAGE/home_page.dart';
import '../SIGN_UP/sign_up.dart';

class SplashScreenProvider extends ChangeNotifier {
  var data;

  pageEntry({context}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    data = preferences.getStringList("login_details");
    print(data);
    if (data != null) {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage())));
    } else {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignUpPge())));
    }
  }
}
