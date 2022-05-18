import 'package:flutter/material.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Constants/IconsConstatnts.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class VehicleDetails extends StatefulWidget {
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(
        text: 'Vehicle Details',
        centerText: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: basicPadding,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: buildContainer('Document', fieldColor2,IconConstants.document)),
                        sbw(10),
                        Expanded(
                            child: buildContainer('Maintenance', fieldColor3,null)),
                        sbw(10),
                        Expanded(
                            child: buildContainer(
                                'Driver & other expenses', buttonGreen,null)),
                      ],
                    ),
                    sbh(20),
                    buildContainer('Trip Book', fieldColor4,IconConstants.tripBook),
                    sbh(20),
                  ],
                ),
              ),
              buildHeading('Profit Loss Summary'),
              Container(
                color: Colors.white,
                padding: padding10,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          width: 125,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: border),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              "All Months",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text("view Profit report"),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    sbh(50),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText("Revenue"),
                          buildText("Expense"),
                          buildText("Profit"),
                        ],
                      ),
                    ),
                    sbh(20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("250"),
                          Text("500"),
                          Text("250"),
                        ],
                      ),
                    ),
                    sbh(50),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildText("Trip Days"),
                          buildText("Refuel"),
                          buildText("Trip Started"),
                        ],
                      ),
                    ),
                    sbh(40),
                  ],
                ),
              ),
              buildHeading('Trip & Expense'),
              sbh(50),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(text) => Text(
        text,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      );

  Widget buildHeading(text) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 37,
      width: width(context),
      color: fieldColor,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }

  Widget buildContainer(text, color, image) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 112,
      width: 100,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image==null?Container():
          Image.asset(
            image,
            height: 70,
            width: 90,
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              text,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
