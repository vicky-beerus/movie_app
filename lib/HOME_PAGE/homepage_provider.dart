import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageProvider extends ChangeNotifier {
  var LoginUserData;
  var movieData;

  getLoginUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    LoginUserData = preferences.getStringList("login_details");
    print(LoginUserData);
    notifyListeners();
  }

  getMoviesData() async {
    var url = Uri.parse("https://hoblist.com/api/movieList");

    var response = await http.post(url, body: {
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting"
    });

    var decodeDetails = json.decode(response.body);
    print(decodeDetails);
    movieData = decodeDetails["result"];
    notifyListeners();
  }
}
