


import 'package:flutter/material.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Screens/HomeScreen.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(text: 'Driver App',statusBarColor: buttonGreen,centerText: true,),
      body: Container(
        padding: basicPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFields('Company Name',controller: controller),
              buildFields('Location',),
              buildFields('Second Phone Number',),
              buildFields('Total Vehicles',),
              buildFields('Set Login Password',),
              buildFields('Confirm Password',),
              Button.submit(onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  return HomeScreen(companyName: controller.text??"",);
                }), (route) => false);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFields(text,{controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        sbh(10),
        Fields(fillColor: fieldColor,controller: controller,),
        sbh(10),
      ],
    );
  }
}
