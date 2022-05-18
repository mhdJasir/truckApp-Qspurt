import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

Widget smallButton(
    {color, text, onTap, Widget icon, textColor = Colors.black}) {
  return Container(
    height: 50,
    width: 150,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          sbw(10),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
      onPressed: onTap,
    ),
  );
}
