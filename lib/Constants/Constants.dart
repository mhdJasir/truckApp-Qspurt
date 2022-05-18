



import 'package:flutter/material.dart';

width(context)=>MediaQuery.of(context).size.width;
height(context)=>MediaQuery.of(context).size.height;

sbh(double h)=>SizedBox(height: h,);
sbw(double w)=>SizedBox(width: w,);

var basicPadding=EdgeInsets.all(20);
var padding10=EdgeInsets.all(10);
var padding5=EdgeInsets.all(5);

var borderRadius5=BorderRadius.circular(5);
var borderRadius10=BorderRadius.circular(10);

List languages=[
  {"name": "English", "locale": Locale('en,US')},
  {"name": "Hindi", "locale": Locale('hi,IN')},
  {"name": "Tamil", "locale": Locale('ta,IN')},
];

