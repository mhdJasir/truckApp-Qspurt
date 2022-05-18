



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Screens/Trips/Filters/Party.dart';
import 'package:truckapp/Screens/Trips/Filters/Routes.dart';
import 'package:truckapp/Screens/Trips/Filters/TripStatus.dart';
import 'package:truckapp/Screens/Trips/Filters/Trucks.dart';
import 'package:truckapp/Screens/Vehicles/TrucksAndDocuments.dart';
import '../../../Constants/ColorConstants.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/TextStyles.dart';
import 'SelectDate.dart';

class Filter extends StatefulWidget {
   Filter({this.setState});
   void Function(void Function()) setState;
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: basicPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Filters", style: Styles.bw5s18),
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              children: [
                Container(
                  width: 120,
                  decoration:
                  BoxDecoration(border: Border.all(color: border)),
                  child: Column(children: [
                    buildBox('Start Date', 0),
                    buildBox('Trip Status', 1),
                    buildBox('POD Challan', 2),
                    buildBox('Truck', 3),
                    buildBox('Party', 4),
                    buildBox('Routes', 5, last: true),
                  ]),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _widget(currentIndex),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: basicPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "0 Trips",
                      style: Styles.bw5s18,
                    ),
                    sbh(10),
                    Text(
                      "Have been Selected",
                      style: Styles.gs14,
                    )
                  ],
                ),
                Container(
                    height: 60,width: 150,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      child: Text("APPLY FILTERS"),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  int currentIndex = 0;

  Widget buildBox(text, int i, {bool last = false}) {
    return InkWell(
      onTap: () {
        currentIndex = i;
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            padding: padding10,
            height: 60,
            width: 150,
            color: currentIndex == i ? Colors.white : fieldColor,
            child: Text(text, style: Styles.b16),
          ),
          Visibility(
            visible: !last,
            child: Container(
              width: 150,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget _widget(int index) {
    switch (index) {
      case 0:
        return SelectDate();
        break;
      case 1:
        return TripStatus();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return MyTrucks();
        break;
      case 4:
        return Party();
        break;
      case 5:
        return Routes();
        break;
      default:
        return SelectDate();
    }
  }
}
