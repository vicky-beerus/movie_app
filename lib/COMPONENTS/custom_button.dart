import 'package:flutter/material.dart';



class Custom_Button extends StatefulWidget {
  double? height;
  double? width;
  String? text;
  double? btText;
  GestureTapCallback? onTap;
  BorderRadius? borderRadius;
  FontWeight? weight;
  Color? color;
  Custom_Button(
      {this.width,
        this.height,
        this.onTap,
        this.text,
        this.color,
        this.btText,
        this.weight,
        this.borderRadius});
  @override
  _Custom_ButtonState createState() => _Custom_ButtonState();
}

class _Custom_ButtonState extends State<Custom_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.color == null
              ? Color(0xff332323).withOpacity(0.9)
              : widget.color,
          borderRadius: widget.borderRadius == null
              ? BorderRadius.circular(30)
              : widget.borderRadius,
          gradient: widget.color == null
              ? LinearGradient(
              colors: <Color>[Colors.pink, Colors.pinkAccent])
              : null),
      child: TextButton(
          onPressed: widget.onTap,
          child: Text(
           "${widget.text}",
            style: TextStyle(
              fontWeight: widget.weight,
              color: Colors.white,
              fontSize: widget.btText == null ? 14 : widget.btText,
            ),

          )),
    );
  }
}