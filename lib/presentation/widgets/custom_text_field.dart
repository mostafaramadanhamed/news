
import 'package:flutter/material.dart';
class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({Key? key,
    this.onChange ,
    required this.hint,
  }) : super(key: key) ;

  final String ?hint;

  final Function(String) ? onChange;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: onChange,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          //  fillColor: SBackgroundColor,
            labelText: hint,
            labelStyle:const TextStyle(
                color: Colors.black
            ),
            errorBorder:buildBorder(border: 16, color: Colors.red),
            focusedBorder: buildBorder(border: 16, color: Colors.black),
            enabledBorder: buildBorder(border: 16, color: Colors.grey),
            border:buildBorder(border: 16, color: Colors.grey)
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({
    required double border,
    required Color color,
  }) {
    return OutlineInputBorder(
        borderSide:  BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(border)
    );
  }
}
