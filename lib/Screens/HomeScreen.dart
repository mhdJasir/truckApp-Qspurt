import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Constants/IconsConstatnts.dart';
import 'package:truckapp/Constants/ImageConstants.dart';
import 'package:truckapp/Model/DatabaseHelper.dart';
import 'package:truckapp/Model/Preferences.dart';
import 'package:truckapp/Screens/CustomerSection/CustomerBalance.dart';
import 'package:truckapp/Screens/DriverSection/DriverBalance.dart';
import 'package:truckapp/Screens/Expenses.dart';
import 'package:truckapp/Screens/Login/Login.dart';
import 'package:truckapp/Screens/Notifications.dart';
import 'package:truckapp/Screens/Reports/Report.dart';
import 'package:truckapp/Screens/Trips/AddTrip.dart';
import 'package:truckapp/Screens/Trips/TripsScreen.dart';
import 'package:truckapp/Screens/Vehicles/TrucksAndDocuments.dart';
import 'package:truckapp/Screens/Vehicles/VehicleAdd%20Screen.dart';
import 'package:truckapp/Screens/Vehicles/Vehicles.dart';
import 'package:truckapp/Widgets/AppBar.dart';

import '../Components/Button.dart';

class HomeScreen extends StatefulWidget {
  var companyName;

  HomeScreen({this.companyName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final name = TextEditingController();
  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(
        centerText: true,
        text: "Driver App",
        actions: [
          IconButton(onPressed: ()async{
            await Preferences.logoutUser();
            Get.offAll(()=>Login());
          }, icon: Icon(Icons.exit_to_app,color: Colors.black,)),
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
                                      'Book New Trip',IconConstants.hotel,TripsScreen(),scale: 1.1))),
                          sbw(15),
                          Expanded(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: gridTile('Vehicle Documents',IconConstants.bus,
                                      TrucksAndDocuments(),scale: 0.8))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              sbh(20),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                childAspectRatio: 1.5,
                children: [
                  gridTile('Customer Balance', IconConstants.people,CustomerBalance()),
                  gridTile('Driver',IconConstants.driver, DriverBalance()),
                  gridTile('Driver', IconConstants.report,DriverBalance()),
                  gridTile('Vehicles',null,Vehicles()),
                  gridTile('Report', IconConstants.driver1,Reports()),
                  gridTile('Expenses', IconConstants.police,Expenses()),
                ],
              ),
              sbh(20),
              Row(
                children: [
                  Expanded(
                      child: buildButton(
                          color: medBlue,
                          text: "ADD TRIP",
                          onTap: () {
                            Get.to(AddTrip());
                          })),
                  sbw(30),
                  Expanded(
                      child: buildButton(
                          color: buttonGreen,
                          text: "ADD VEHICLE",
                          onTap: () {
                            Get.to(AddVehicles());
                          })),
                ],
              ),
            ],
          ),
        ),
      ),
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

  Widget buildTextButton(text, route) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return route;
            }));
          },
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        sbh(20),
      ],
    );
  }
}
