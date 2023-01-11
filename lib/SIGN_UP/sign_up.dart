import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapps/SIGN_UP/signup_provider.dart';

import 'package:provider/provider.dart';

import '../COMPONENTS/custom_button.dart';
import '../COMPONENTS/custom_formfields.dart';

class SignUpPge extends StatefulWidget {
  const SignUpPge({Key? key}) : super(key: key);

  @override
  State<SignUpPge> createState() => _SignUpPgeState();
}

class _SignUpPgeState extends State<SignUpPge> {
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: Color(0xffFF1C62),
          title: Text(
            "Sign UP",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          height: h,
          width: w,
          child: Column(
            children: [
              SizedBox(
                height: h * 0.02,
              ),
              CustomFormField(
                height: h * 0.06,
                width: w * 0.9,
                hintText: "User Name",
                controller: Provider.of<SignUpProvider>(context, listen: true)
                    .userNameController,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              CustomFormField(
                height: h * 0.06,
                width: w * 0.9,
                hintText: "E-mail",
                controller: Provider.of<SignUpProvider>(context, listen: true)
                    .emailController,
                suffix: Icon(
                  Icons.email,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              CustomFormField(
                height: h * 0.06,
                width: w * 0.9,
                hintText: "Phone",
                controller: Provider.of<SignUpProvider>(context, listen: true)
                    .phoneController,
                suffix: Icon(
                  Icons.phone,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              CustomFormField(
                height: h * 0.06,
                width: w * 0.9,
                hintText: "New PassWord",
                controller: Provider.of<SignUpProvider>(context, listen: true)
                    .newPasswordController,
                suffix: InkWell(
                    onTap: () {
                      Provider.of<SignUpProvider>(context, listen: false)
                          .newPasswordEnable();
                    },
                    child: Provider.of<SignUpProvider>(context, listen: true)
                                .newPassWord ==
                            true
                        ? Icon(
                            Icons.remove_red_eye,
                            color: Colors.pinkAccent,
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.pinkAccent,
                          )),
                obScureTexts: Provider.of<SignUpProvider>(context, listen: true)
                    .newPassWord,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              CustomFormField(
                height: h * 0.06,
                width: w * 0.9,
                hintText: "Confrim Password",
                controller: Provider.of<SignUpProvider>(context, listen: false)
                    .confrimPasswordController,
                suffix: InkWell(
                    onTap: () {
                      Provider.of<SignUpProvider>(context, listen: false)
                          .confrimPasswordEnable();
                    },
                    child: Provider.of<SignUpProvider>(context, listen: false)
                                .conrimPassWord ==
                            true
                        ? Icon(Icons.remove_red_eye, color: Colors.pink)
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.pinkAccent,
                          )),
                obScureTexts:
                    Provider.of<SignUpProvider>(context, listen: false)
                        .conrimPassWord,
              ),
              SizedBox(
                height: h * 0.2,
              ),
              Custom_Button(
                height: h * 0.06,
                width: w * 0.45,
                text: "Sign Up",
                onTap: () {
                  Provider.of<SignUpProvider>(context, listen: false)
                      .userSignUp(context: context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
