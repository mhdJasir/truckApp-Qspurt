import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Constants/IconsConstatnts.dart';
import 'package:truckapp/Constants/TextStyles.dart';
import 'package:truckapp/Screens/Trips/AddTrip.dart';
import 'package:truckapp/Screens/Trips/Filters/Filter.dart';
import 'package:truckapp/Screens/Trips/TripDetails/TripDetails.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key key}) : super(key: key);

  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fieldColor,
      appBar: DriverAppBar(
        text: 'Trips',
        centerText: true,
        statusBarColor: buttonGreen,
      ),
      body: Stack(
        children: [
          Container(
            padding: basicPadding,
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Fields(
                        hint: 'Search for Trips',
                        fillColor: Colors.white,
                        prefix: Icon(Icons.search),
                      ),
                    ),
                    sbw(10),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          constraints: BoxConstraints(
                            maxHeight: height(context) * 0.75,
                            minWidth: width(context),
                          ),
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                          context: context,
                          builder: (c) {
                            return StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return Filter(setState: setState,);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 48,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: borderRadius5, color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(IconConstants.filter_alt_outlined),
                            sbw(10),
                            Text(
                              "Filters",
                              style: Styles.bw5s13,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                sbh(20),
                for (int i = 0; i < 4; i++)
                  InkWell(
                    onTap: () {
                      Get.to(TripDetails());
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: padding10,
                          height: 170,
                          width: width(context),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Vijash Kinfra",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      sbh(10),
                                      Row(
                                        children: [
                                          Text(
                                            "KL 10 AR",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "1188",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: lowOpWhite),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "\u20B9250",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        sbw(10),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              sbh(20),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Delhi"),
                                      sbh(5),
                                      Text(
                                        "03 Dec 2021",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      )
                                    ],
                                  ),
                                  sbw(15),
                                  SizedBox(
                                    width: 40,
                                    child: Divider(
                                      thickness: 1.4,
                                    ),
                                  ),
                                  sbw(5),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: border, width: 2)),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  sbw(5),
                                  SizedBox(
                                    width: 40,
                                    child: Divider(
                                      thickness: 1.4,
                                    ),
                                  ),
                                  sbw(10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Delhi"),
                                      sbh(5),
                                      Text(
                                        "03 Dec 2021",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              sbh(20),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                  ),
                                  sbw(20),
                                  Text(
                                    "Trip Completed",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        sbh(10),
                      ],
                    ),
                  ),
                sbh(50)
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: buildButton(
                text: 'ADD TRIP',
                color: buttonGreen,
                onTap: () {
                  Get.to(AddTrip());
                }),
          ),
        ],
      ),
    );
  }
}
