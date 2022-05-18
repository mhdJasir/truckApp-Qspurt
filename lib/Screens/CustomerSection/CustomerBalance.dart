import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Widgets/AppBar.dart';

import '../DriverSection/DriverTransactions.dart';

class CustomerBalance extends StatefulWidget {
  const CustomerBalance({Key key}) : super(key: key);

  @override
  _CustomerBalanceState createState() => _CustomerBalanceState();
}

class _CustomerBalanceState extends State<CustomerBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DriverAppBar(
        centerText: true,
        text: "Customer Balance",
      ),
      body: SafeArea(
        child: Container(
          padding: basicPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 60,
                  width: width(context),
                  color: Colors.white70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Customer balance',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      Text('1500',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                    ],
                  ),
                ),
                sbh(20),
                Fields(
                  fillColor: fieldColor,
                  hint: 'Search Customer',
                ),
                sbh(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customer name',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Balance',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                sbh(10),
                buildContainer("Prageen", "1000/-"),
                sbh(10),
                buildContainer("Sooraj", "500/-"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer(name, amount) {
    return InkWell(
      onTap: () {
        Get.to(DriverTransactions());
      },
      child: Container(
        height: 53,
        decoration: BoxDecoration(
          borderRadius: borderRadius5,
          color: fieldColor,
        ),
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,style: TextStyle(fontSize: 12),),
            Text(amount,style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
