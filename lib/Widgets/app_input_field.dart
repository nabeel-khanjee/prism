import 'package:flutter/material.dart';
import 'package:prism/Utils/colors.dart';

class AppInputFIeld extends StatelessWidget {
  const AppInputFIeld({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.initialValue,
    required this.label,required this.fieldIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final String initialValue;
  final String label;
  final IconData fieldIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
      child: TextFormField(
        obscureText: obscureText,
        // initialValue: initialValue,
        controller: controller,

        decoration: InputDecoration(
            prefixIcon:Icon( fieldIcon,color: appColor,),
            labelStyle: TextStyle(color: Colors.grey),
            label: Text(label),
            border: InputBorder.none,
            hintText: initialValue,
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
