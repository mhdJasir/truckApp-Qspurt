import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Screens/Reports/PartyRevenueReport.dart';
import 'package:truckapp/Widgets/AppBar.dart';
import 'package:truckapp/Widgets/PdfView.dart';

class Reports extends StatefulWidget {
  const Reports({Key key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fieldColor,
      appBar: DriverAppBar(
        text: 'Reports',
      ),
      body: Container(
        margin: basicPadding,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Get.to(() => PdfView());
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: border),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Profit & Loss Report",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    sbh(10),
                    Text(
                      "\u20B93261 for December",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            sbh(20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                buildCards(
                  'Truck Revenue Report',
                ),
                buildCards(
                  'Party Revenue Report',
                  onTap: () => Get.to(() => PartyRevenueReport()),
                ),
                buildCards(
                  'Party Balance Report',
                ),
                buildCards(
                  'Supplier Balance Report',
                ),
                buildCards(
                  'Transaction Report',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCards(text, {onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
          color: Colors.white,
        ),
        padding: padding10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 125,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
