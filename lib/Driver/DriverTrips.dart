import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Widgets/AppBar.dart';
import 'DriverAddTrips.dart';

class DriverTrips extends StatefulWidget {
  const DriverTrips({Key key}) : super(key: key);

  @override
  _DriverTripsState createState() => _DriverTripsState();
}

class _DriverTripsState extends State<DriverTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fieldColor,
      appBar: DriverAppBar(
        text: 'Trips',
        centerText: true,
        backButton: false,
      ),
      body: Container(
        padding: basicPadding,
        child: Column(
          children: [
            Fields(
              hint: 'Search Trips',
            ),
            sbh(20),
            Container(
              height: 200,
              width: width(context),
              decoration: BoxDecoration(
                  borderRadius: borderRadius5, color: Colors.white),
            ),
            Spacer(),
            buildButton(
                color: buttonGreen,
                onTap: () {
                  Get.to(() => DriverAddTrips());
                },
                text: 'ADD TRIP'),
          ],
        ),
      ),
    );
  }
}
