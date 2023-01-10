import 'package:flutter/material.dart';
import 'package:movieapp/LOGIN_PAGE/login_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUpProvider extends ChangeNotifier{


  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();


  bool newPassWord = true;
  bool conrimPassWord = true;


  newPasswordEnable(){
    newPassWord = ! newPassWord;
    notifyListeners();
  }

  confrimPasswordEnable(){
    conrimPassWord = ! conrimPassWord;
    notifyListeners();
  }


  userSignUp({context})async{

    if(phoneController.text.isEmpty && emailController.text.isEmpty && phoneController.text.isEmpty && newPasswordController.text.isEmpty && confrimPasswordController.text.isEmpty){
     final snackBar = SnackBar(content: Text("Checck All Fields"),backgroundColor: Colors.red,);
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      if(newPasswordController.text != confrimPasswordController.text){
        final snackBar = SnackBar(content: Text("Check Your Password"),backgroundColor: Colors.red,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{

        List<String> userDetails = [
          userNameController.text,
          emailController.text,
          confrimPasswordController.text,
          phoneController.text
        ];

       SharedPreferences preferences = await SharedPreferences.getInstance();
       preferences.setStringList("user_details", userDetails);


        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));}
    }

  }

}
