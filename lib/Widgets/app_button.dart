import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.opTap,
    required this.buttonName,required this.width,
  }) : super(key: key);
  final double width;
  final VoidCallback opTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: opTap,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 48, 76, 83),
              Color.fromARGB(153, 56, 100, 102),
            ])),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
