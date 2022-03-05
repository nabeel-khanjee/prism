
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    Key? key,
    this.buttonTitle = "Null",
    this.iconData = FontAwesomeIcons.user,
    this.iconColor = Colors.grey,
    required this.onTap, this.textColor=Colors.grey,
  }) : super(key: key);
  final String buttonTitle;
  final IconData iconData;
  final Color iconColor;
  final VoidCallback onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          iconData,
          color: iconColor,
        ),
        title: Text(
          buttonTitle,
          style: TextStyle(color: Colors.grey),
        ),
        onTap: onTap);
  }
}
