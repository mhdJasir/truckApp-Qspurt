import 'package:flutter/material.dart';

import '../Constants/Constants.dart';
import '../Constants/TextStyles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.text,
    this.onTap,
    @required this.color,
    this.height=50,
    this.width=200,
  })  : widget = Text(
          text,
          style: Styles.blw500s13,
        ),
        radius = borderRadius10;

  String text;
  void Function() onTap;
  Widget widget;
  var color;
  BorderRadiusGeometry radius;
  double height,width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue[500], width: 1.5),
          borderRadius: radius),
      child: ElevatedButton(
        onPressed: onTap,
        child: widget,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius10),
          primary: color,
        ),
      ),
    );
  }
}
