import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/DatePicker.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Screens/Trips/TripDetails/Driver.dart';
import 'package:truckapp/Screens/Trips/TripDetails/Profit.dart';

import '../../../Components/DropDownWidget.dart';
import '../../../Components/Simple Field.dart';
import '../../../Constants/TextStyles.dart';
import '../../../Widgets/CustomIndicator/CustomIndicator.dart';
import 'Party.dart';

class TripDetails extends StatefulWidget {
  const TripDetails({Key key}) : super(key: key);

  @override
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: fieldColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.grey[700],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trip Details",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              sbh(5),
              Text(
                'LRN-002',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                sbw(5),
                PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: Colors.black,
                    ),
                    onSelected: (val) {},
                    itemBuilder: (c) {
                      return ['Delete Tip', 'Call Party', 'Call Driver']
                          .map((e) {
                        return PopupMenuItem(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            ));
                      }).toList();
                    }),
                sbw(5),
              ],
            ),
          ],
        ),
        body: Column(children: [
          Container(
            padding: padding10,
            color: Colors.black,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: padding10,
                  height: 60,
                  width: width(context) - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.truck,
                            size: 15,
                          ),
                          sbw(10),
                          Text(
                            "KL 10 AR 1188",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.drive_eta_rounded,
                            size: 15,
                          ),
                          sbw(10),
                          Text(
                            'Prageen',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
                indicator: MD2Indicator(
                  indicatorSize: MD2IndicatorSize.full,
                  indicatorHeight: 8.0,
                  indicatorColor: darkBlue,
                ),
                labelStyle: TextStyle(color: Colors.black),
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Party',
                  ),
                  Tab(
                    text: 'Profit',
                  ),
                  Tab(
                    text: 'Driver',
                  ),
                  Tab(
                    text: 'More',
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(children: [
              Party(),
              Profit(),
              Driver(),
              Container(),
            ]),
          )
        ]),
      ),
    );
  }
}
