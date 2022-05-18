



  import 'package:flutter/material.dart';

pickDate(context,{Function(String) setDate}){
    var datePicked = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 45)),
    );
    datePicked.then((value) {
      if(value!=null) {
        setDate("${value?.day}/${value?.month}/${value?.year}");
      }
    });
  }