




import 'package:flutter/material.dart';

push(context,route){
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return route();
  }));
}

pushAndReplace(context,route){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return route();
  }));
}
pop(context){
  Navigator.maybePop(context);
}