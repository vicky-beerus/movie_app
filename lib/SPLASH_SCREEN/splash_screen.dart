import 'package:flutter/material.dart';
import 'package:movieapps/SPLASH_SCREEN/splashscreen_provider.dart';

import 'package:provider/provider.dart';

import '../SIGN_UP/sign_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<SplashScreenProvider>(context, listen: false)
        .pageEntry(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: Color(0xffFF1C62),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: h * 0.4),
            Icon(
              Icons.movie_creation_outlined,
              size: 85,
              color: Colors.white,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => SignUpPge()));
              },
              child: Container(
                height: h * 0.1,
                width: w,
                alignment: Alignment.topCenter,
                child: Text(
                  "Movie App",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
