import "package:flutter/material.dart";

class CustomFormField extends StatefulWidget {
  double? height;
  double? width;
  bool? shadowWant;
  Color? color;
  TextEditingController? controller;
  Widget? prefix;
  Widget? suffix;
  String? hintText;
  bool? readonly;

  bool? obScureTexts;
  CustomFormField(
      {this.height,
        this.width,
        this.color,
        this.controller,
        this.suffix,
        this.prefix,
        this.hintText,
        this.shadowWant,
        this.readonly,
        this.obScureTexts});
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  var fcmsignToken;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        // boxShadow: widget.shadowWant == null
        //     ? [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2)]
        //     : null,
          border: Border.all(color: Color(0xff00333B)),
          color: widget.color,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        readOnly: widget.readonly != null ? true : false,
        obscureText: widget.obScureTexts == false || widget.obScureTexts == null
            ? false
            : true,
        controller: widget.controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            prefixIcon: widget.prefix,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                fontFamily: 'Poppins', color: Color(0xff00333B), fontSize: 14),
            suffixIcon: widget.suffix),
      ),
    );
  }
}