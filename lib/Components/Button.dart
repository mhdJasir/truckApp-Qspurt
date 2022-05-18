

import 'package:flutter/material.dart';
import 'package:truckapp/Constants/ColorConstants.dart';

class Button extends StatefulWidget {
  Button({@required this.text,@required this.onTap,this.color});
  Button.submit({@required this.onTap,this.color}):text='Submit';
  void Function() onTap;
  String text = "";
  var color=buttonGreen;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: Material(
          borderRadius: BorderRadius.circular(5),
          color: buttonGreen,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            child: Center(
                child:
                Text(widget.text, style: TextStyle(color: Colors.white,fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1))),
            onTap: widget.onTap,
          ),
        ),
      ),
    );
  }
}


Widget buildButton({color,text,onTap}) {
  return Container(
    height: 50,
    width: 180,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))),
      child: Text(text),
      onPressed: onTap,
    ),
  );
}