import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapps/COMPONENTS/custom_button.dart';
import 'package:movieapps/HOME_PAGE/homepage_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomePageProvider>(context, listen: false).getLoginUser();
    Provider.of<HomePageProvider>(context, listen: false).getMoviesData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Movie App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: h * 0.1,
                width: w,
                color: Colors.pinkAccent,
              ),
              ListTile(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: Text('Company Info'),
                        contentPadding: EdgeInsets.only(left: 3, right: 3),
                        content: Container(
                            height: h * 0.3,
                            width: w,
                            child: Column(
                              children: [
                                Container(
                                  height: h * 0.1,
                                  width: w,
                                  child: Row(
                                    children: [
                                      Text("Company: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                          "Geeksynergy Technologies \n Pvt Ltd"),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("Address: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    Text("Sanjayanagar, Bengaluru-56"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Phone: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text("XXXXXXXXX09"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Email:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                      "XXXXXX@gmail.com",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      );
                    },
                  );
                },
                leading: Icon(
                  Icons.info,
                  color: Colors.pinkAccent,
                ),
                title: Text(
                  "Company Info",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              )
            ],
          ),
        ),
        body: Container(
          height: h,
          width: w,
          child: Provider.of<HomePageProvider>(context, listen: true)
                      .movieData ==
                  null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    Container(
                      height: h * 0.08,
                      width: w,
                      padding: EdgeInsets.only(top: 10, left: 15),
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20))),
                      child: Text(
                        "Welcome ${Provider.of<HomePageProvider>(context, listen: true).LoginUserData[0]}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: h * 0.75,
                      child: ListView.builder(
                          itemCount: Provider.of<HomePageProvider>(context,
                                  listen: true)
                              .movieData
                              .length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 5),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: h * 0.26,
                              width: w,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 0.05))),
                              child: Column(
                                children: [
                                  Container(
                                    height: h * 0.2,
                                    width: w,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: w * 0.2,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: h * 0.06,
                                                child: Icon(
                                                  Icons.arrow_drop_up,
                                                  size: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                height: h * 0.06,
                                                child: Center(
                                                    child: Text(
                                                  "${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["totalVoted"]}",
                                                  style:
                                                      TextStyle(fontSize: 25),
                                                )),
                                              ),
                                              SizedBox(
                                                height: h * 0.06,
                                                child: Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 50,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: w * 0.25,
                                          alignment: Alignment.centerRight,
                                          child: Image.network(
                                              "${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["poster"]}"),
                                        ),
                                        Container(
                                          width: w * 0.55,
                                          child: Column(children: [
                                            buildContainer(h, w,
                                                txt:
                                                    "${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["title"]}",
                                                size: 18.0),
                                            buildContainer(
                                              h,
                                              w,
                                              txt:
                                                  "Genere : ${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["genre"]}",
                                            ),
                                            buildContainer(
                                              h,
                                              w,
                                              txt:
                                                  "Director : ${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["director"][0]}",
                                            ),
                                            buildContainer(
                                              h,
                                              w,
                                              txt:
                                                  "Starring : ${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["stars"].toString().substring(1, 15)}....",
                                            ),
                                            buildContainer(
                                              h,
                                              w,
                                              txt:
                                                  "${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["runTime"]} | ${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["language"]} | ${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["releasedDate"]}",
                                            ),
                                            buildContainer(h, w,
                                                txt:
                                                    "${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["pageViews"]} views | Vetoed by ${Provider.of<HomePageProvider>(context, listen: true).movieData[index]["voting"]} people",
                                                color: Colors.lightBlue),
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: h * 0.05,
                                    width: w,
                                    alignment: Alignment.center,
                                    child: Custom_Button(
                                      borderRadius: BorderRadius.circular(5),
                                      height: h * 0.04,
                                      width: w * 0.9,
                                      color: Colors.lightBlue,
                                      text: "Watch Trailer",
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Container buildContainer(double h, double w, {txt, size, color}) {
    return Container(
      height: h * 0.03,
      width: w * 0.55,
      padding: EdgeInsets.only(left: 7, top: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        txt,
        style: TextStyle(
            fontSize: size == null ? 13.0 : size,
            color: color == null ? Colors.black : color),
      ),
    );
  }
}
