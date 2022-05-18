import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Screens/Vehicles/VehicleAdd%20Screen.dart';
import 'package:truckapp/Screens/Vehicles/VehicleDetails.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class Vehicles extends StatefulWidget {
  const Vehicles({Key key}) : super(key: key);

  @override
  _VehiclesState createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(text: 'Vehicle',centerText: true,statusBarColor: buttonGreen,),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: basicPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: counts('All Trucks', '5')),
                      sbw(5),
                      Expanded(child: counts('Available Vehicles', '5')),
                      sbw(5),
                      Expanded(child: counts('On trip', '5')),
                    ],
                  ),
                  sbh(20),
                  Fields(
                    fillColor: fieldColor,
                    hint: 'Search vehicle',
                  ),
                  sbh(20),
                  tripStatus('Kl 10 Ak 3318', 'Available',true),
                  tripStatus('Kl 10 Ak 3318', 'On trip',false),
                  sbh(height(context)*0.23),
                  Button(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c){
                      return AddVehicles();
                    }));
                  }, text: 'Add Vehicle'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tripStatus(number, status,bool available) {
    return Column(
      children: [
        Container(
          height: 76,
          decoration: BoxDecoration(
            borderRadius: borderRadius5,
            color: fieldColor,
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(number),
                  Row(
                    children: [
                      CircleAvatar(radius: 5,
                      backgroundColor: available?Colors.green:Colors.red,),
                      sbw(5),
                      Text(status),
                    ],
                  ),
                ],
              ),
              sbh(10),
              Visibility(
                  visible: !available,
                  child: Text('Calicut to kochi')),
            ],
          ),
        ),
        sbh(15),
      ],
    );
  }

  Widget counts(text1, text2) {
    return InkWell(
      onTap: (){
        Get.to(VehicleDetails());
      },
      child: Container(
        padding: EdgeInsets.all(2),
        height: 86,
        decoration: BoxDecoration(
          borderRadius: borderRadius5,
          color: fieldColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),
            ),
            Text(
              text2,
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
