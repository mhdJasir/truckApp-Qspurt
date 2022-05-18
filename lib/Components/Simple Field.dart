import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/TextStyles.dart';

import '../Constants/Constants.dart';

var borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: Colors.grey,
    ));

Widget textFields(context, {controller, hintText}) {
  return Column(children: [
    Container(
      height: 70,
      color: fieldColor,
      width: width(context) * 0.85,
      child: TextFormField(
        maxLines: 2,
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "mobile number can't be empty";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        autofillHints: [AutofillHints.telephoneNumber],
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: fieldColor,
          border: borderStyle,
          focusedBorder: borderStyle,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          hintStyle: TextStyle(
            fontSize: 16,
          ),
          focusedErrorBorder: borderStyle,
        ),
        cursorColor: Colors.grey[500],
      ),
    ),
    SizedBox(
      height: 25,
    ),
  ]);
}

class Fields extends StatelessWidget {
  Fields(
      {this.controller,
      this.hint = "",
      this.fillColor = Colors.white,
      this.suffix,
      this.prefix,
      this.label})
      : readOnly = false;

  Fields.numberType(
      {this.controller,
      this.hint = "",
      this.type,
      this.inputFormatters,
      this.fillColor = Colors.white})
      : readOnly = false;

  Fields.datePick(
      {this.hint = "",
      this.suffix,
      this.onTap,
        this.label,
      this.controller,
      this.fillColor = Colors.white70})
      : readOnly = true;

  Fields.search({this.controller, this.hint, this.fillColor})
      : suffix = Icon(
          Icons.search,
          color: Colors.black,
        );
  List<TextInputFormatter> inputFormatters;
  TextEditingController controller;
  bool readOnly = false;
  String hint;
  String label;
  Color fillColor = Colors.white;
  TextInputType type;
  void Function() onTap;
  Widget suffix;
  Widget prefix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        readOnly: readOnly,
        validator: (val) {
          if (val.isEmpty) {
            return "something not right !";
          }
          return null;
        },
        keyboardType: type,
        controller: controller,
        onTap: onTap,
        inputFormatters: inputFormatters,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: prefix,
          contentPadding: EdgeInsets.all(10),
          fillColor: fillColor,
          filled: true,
          border: InputBorder.none,
          labelText: label,
          labelStyle: Styles.gw5,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: borderStyle(),
          focusedErrorBorder: borderStyle(),
          errorBorder: borderStyle(),
          enabledBorder: borderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: border));
  }
}
