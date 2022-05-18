import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Constants/IconsConstatnts.dart';
import 'package:truckapp/Constants/ImageConstants.dart';
import 'package:truckapp/Driver/DriverAddTrips.dart';
import 'package:truckapp/Driver/DriverTrips.dart';
import 'package:truckapp/Screens/Notifications.dart';
import 'package:truckapp/Screens/Trips/AddTrip.dart';
import 'package:truckapp/Screens/Trips/TripsScreen.dart';
import 'package:truckapp/Screens/Vehicles/TrucksAndDocuments.dart';
import 'package:truckapp/Widgets/AppBar.dart';
import '../Components/Button.dart';

class DriverHome extends StatefulWidget {
  var companyName;

  DriverHome({this.companyName});

  @override
  _DriverHomeState createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  final name = TextEditingController();
  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(
        centerText: true,
        text: "Driver App",
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.to(Notifications());
              },
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 30,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        '12',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          sbw(10),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Column(
            children: [
              Container(
                padding: basicPadding,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(homeBg), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "December Revenue",
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          padding: padding10,
                          height: 35,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(IconConstants.viewReport,height: 30,width: 20,),
                              Text(
                                "View Report",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    sbh(10),
                    Row(
                      children: [
                        Text(
                          "2500",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        sbw(10),
                        Text(
                          "For 10 trips",
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                    sbh(20),
                    SizedBox(
                      height: 102,
                      child: Row(
                        children: [
                          Expanded(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: gridTile(
                                      'Book New Trip',IconConstants.hotel,DriverTrips(),scale: 1.1))),
                          sbw(15),
                          Expanded(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: gridTile('Vehicle Documents',IconConstants.bus,
                                      null,scale: 0.8))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              sbh(10),
              buildContainer(),
              buildContainer(),
              buildContainer(),
              sbh(20),
              buildButton(
                  color: medBlue,
                  text: "ADD TRIP",
                  onTap: () {
                    Get.to(()=>DriverAddTrips());
                  }),
            ],
          ),
        ),
      ),
    );
  }
Widget buildContainer(){
    return Column(
      children: [
        Container(
          height: 100,width: width(context),
          decoration: BoxDecoration(
            borderRadius: borderRadius10,
            color: Colors.white,
          ),
        ),
        sbh(10),
      ],
    );
}
  Widget gridTile(text,image,route,{double scale=1.0}) {
    return InkWell(
      onTap: () {
        Get.to(route);
      },
      child: Container(
        padding: padding5,
        height: 100,
        width: 170,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 70,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                image==null?Container():
                Transform.scale(
                    scale: scale,
                    child: Image.asset(image,height: 60,width: 50,fit: BoxFit.contain,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
