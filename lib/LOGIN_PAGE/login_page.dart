import 'package:flutter/material.dart';
import 'package:movieapp/COMPONENTS/custom_button.dart';
import 'package:movieapp/COMPONENTS/custom_formfields.dart';
import 'package:movieapp/LOGIN_PAGE/login_provider.dart';
import 'package:movieapp/SIGN_UP/sign_up.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    Provider.of<LoginProvider>(context,listen: false).getUserDetils();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPge()));
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        backgroundColor:Color(0xffFF1C62),
        title: Text("Log In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700), ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Icon(Icons.movie_creation_outlined,size: 65,color: Colors.pinkAccent,),
            Container(
              height: h*0.1,
              width: w,
              alignment: Alignment.topCenter,
              child: Text("Login Into Movie App",style: TextStyle(
                  color: Colors.pinkAccent,fontSize: 25

              ),),
            ),
            SizedBox(
              height: h*0.02,
            ),
            CustomFormField(
              height: h*0.06,
              width: w*0.9,
              hintText: "User Name",
              controller: Provider.of<LoginProvider>(context,listen: true).loginUserNameController,
            ),
            SizedBox(
              height: h*0.05,
            ),
            CustomFormField(
              height: h*0.06,
              width: w*0.9,
              hintText: "Password",
              obScureTexts:Provider.of<LoginProvider>(context,listen: true).showPassword ,
              controller: Provider.of<LoginProvider>(context,listen: true).loginPassWordController,
              suffix: InkWell(onTap: (){
                Provider.of<LoginProvider>(context,listen: false).showPassWords();
              },child:Provider.of<LoginProvider>(context,listen: true).showPassword!= false? Icon(Icons.remove_red_eye,color: Colors.pinkAccent,):Icon(Icons.remove_red_eye_outlined,color: Colors.pinkAccent,)),
            ),
            SizedBox(height: h*0.1,),
            Custom_Button(
              height: h*0.06,
              width: w*0.45,
              text: "Log In",
              onTap: (){

Provider.of<LoginProvider>(context,listen: false).userCheck(context: context);
              },
            )
          ],
        ),

      ),
    );
  }
}
