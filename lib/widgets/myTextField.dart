import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  String data;
  final String label;
  final String hint;
  final TextInputType text;
  final bool pass;
  Function onChanged;
  MyTextFiled(this.onChanged, this.label, this.hint, this.text, this.pass);
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: pass,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        focusColor: Color(0xff0962ff),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: BorderSide(
            color: Color(0xff0962ff),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey[350],
          ),
        ),
      ),
    );
  }
}
