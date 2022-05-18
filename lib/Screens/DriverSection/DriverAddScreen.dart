import 'dart:io';
import 'package:flutter/material.dart';
import 'package:truckapp/Components/DatePicker.dart';
import 'package:truckapp/Components/PickImage.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Widgets/AppBar.dart';

import '../../Components/Button.dart';
import '../../Components/Simple Field.dart';

class AddDriver extends StatefulWidget {
  @override
  _AddDriverState createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DriverAppBar(
        text: "Driver",
        centerText: true,
      ),
      body: SafeArea(
        child: Container(
          padding: basicPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  buildText('Driver Name'),
                buildField(),
                sbh(10),
                buildText('Phone number'),
                buildField(),
                buildText('License number'),
                buildField(),
                buildText('License Expire date'),
                Fields.datePick(
                  hint: '',
                  onTap: (){
                    pickDate(context,setDate: (val){
                      date.text=val;
                      setState(() {});
                    });
                  },
                  controller: date,
                  fillColor: fieldColor,
                ),
                sbh(20),
                Row(
                  children: [
                    imagePickerWidget('front',image1),
                    sbw(10),
                    imagePickerWidget('Back',image2,),
                  ],
                ),
                sbh(50),
                Button.submit(onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imagePickerWidget(text,image) {
    return Column(
      children: [
        SizedBox(
          height: 54,
          width: 71,
          child: PickImage(
            text: "",
            setImage: (val){
              image=val;
              setState(() { });
            }
          ),
        ),
        Text(text,style: TextStyle(fontSize: 12),),
      ],
    );
  }

  var image1;
  var image2;

  Widget buildField({controller}) {
    return Column(
      children: [
        Fields(
          fillColor: fieldColor,
          controller: controller,
        ),
        sbh(10),
      ],
    );
  }

  Widget buildText(text) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
        sbh(10),
      ],
    );
  }
}
