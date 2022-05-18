

import 'package:flutter/material.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class DriverAddTrips extends StatelessWidget {
  const DriverAddTrips({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(
        text: 'Add Trips',
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
