import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truckapp/Screens/Login/Login.dart';
import 'package:truckapp/Screens/Register.dart';
import '../../Model/Preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Timer(Duration(seconds: 3), () async{
     bool isLogin=await Preferences.checkIsLogin();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c){
        if (!isLogin) {
          return Login();
        }
        else
          return Register();
      }), (route) => false);
    });
    super.initState();
  }
  @override
  void dispose() {
    Timer(Duration.zero, (){}).cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Splash',style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.w700,
                fontSize: 25
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
