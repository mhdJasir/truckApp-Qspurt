import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Screens/DriverSection/DriverAddScreen.dart';
import 'package:truckapp/Screens/DriverSection/DriverTransactions.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class DriverBalance extends StatefulWidget {
  const DriverBalance({Key key}) : super(key: key);

  @override
  _DriverBalanceState createState() => _DriverBalanceState();
}

class _DriverBalanceState extends State<DriverBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fieldColor,
      appBar: DriverAppBar(
        text: 'Drivers',
      ),
      body: Container(
        padding: basicPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: basicPadding,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: borderRadius5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Driver Balance"),
                    Text(
                      "\u20B9100",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
              sbh(10),
              Fields.search(
                fillColor: Colors.white,
                hint: 'Search by Driver Name',
              ),
              sbh(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "driver name".toUpperCase(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("balance".toUpperCase(),
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              sbh(20),
              balanceTile(darkGreen,"LA",'Laundry 131','100'),
              sbh(5),
              balanceTile(Colors.grey,"PR",'Prageen','0'),
              sbh(height(context)*0.32),
              Button(text: 'Add Driver', onTap: (){
                Get.to(AddDriver());
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget balanceTile(color,prefixText,name,amount) {
    return InkWell(
      onTap: (){
        Get.to(DriverTransactions());
      },
      child: Container(
        height: 60,
        decoration:
        BoxDecoration(borderRadius: borderRadius5, color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      color: color),
                ),
                sbw(20),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Color(0xffa00e0e),
                  child: Center(
                    child: Text(
                      prefixText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                sbw(20),
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Text('\u20B9$amount'),
                sbw(15),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                ),
                sbw(10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
