import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier{


  TextEditingController loginUserNameController = TextEditingController();
  TextEditingController loginPassWordController = TextEditingController();
  var getUserDetail;


  bool showPassword = true;

  showPassWords(){
    showPassword = ! showPassword;
    notifyListeners();
  }



  userCheck({context})async{
print(getUserDetail);
    if(loginPassWordController.text.isEmpty && loginUserNameController.text.isEmpty){
      final snackBar = SnackBar(content: Text("Please Enter Username and Password"),backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{

      if(loginUserNameController.text.toString() == getUserDetail[0] && loginPassWordController.text.toString() ==getUserDetail[2]){

        List<String> loginDetils = [loginUserNameController.text,loginPassWordController.text];

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setStringList("login_details", loginDetils);

        final snackBar = SnackBar(content: Text("Login Successfully"),backgroundColor: Colors.pinkAccent,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);



      }else{
        final snackBar = SnackBar(content: Text("Please Check Username and Password"),backgroundColor: Colors.red,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    }


  }


  getUserDetils()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    getUserDetail = preferences.getStringList("user_details");
    print("user detils : $getUserDetail");


  }


}