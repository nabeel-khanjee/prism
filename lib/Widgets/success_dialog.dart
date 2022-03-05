import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prism/Utils/colors.dart';

showSucessDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                content: Row(
              children: [
                Icon(
                  FontAwesomeIcons.checkCircle,
                  color: appColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Successfully Uploaded",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )));
    // Navigator.pop(context);
  }