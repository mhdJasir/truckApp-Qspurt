import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DriverAppBar extends AppBar {
  final String text;
  final List<Widget> actions;
  final statusBarColor;
  bool centerText;
  bool backButton;

  DriverAppBar({
    @required this.text,
    this.actions,
    this.statusBarColor,
    this.centerText = false,
    this.backButton=true,
  }) : super(
            leading: backButton
                ? Transform.scale(
                    scale: 1.2, child: BackButton(color: Colors.grey[500]))
                : Container(),
            title: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            centerTitle: centerText,
            elevation: 0,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: statusBarColor),
            backgroundColor: Colors.white,
            actions: actions);
}
