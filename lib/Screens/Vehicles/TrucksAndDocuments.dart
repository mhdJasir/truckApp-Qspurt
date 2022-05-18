import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckapp/Screens/Vehicles/VehicleDetails.dart';
import 'package:truckapp/Widgets/AppBar.dart';

import '../../Components/Simple Field.dart';
import '../../Constants/ColorConstants.dart';
import '../../Constants/Constants.dart';
import '../../Widgets/CustomIndicator/CustomIndicator.dart';

class TrucksAndDocuments extends StatefulWidget {
  const TrucksAndDocuments({Key key}) : super(key: key);

  @override
  _TrucksAndDocumentsState createState() => _TrucksAndDocumentsState();
}

class _TrucksAndDocumentsState extends State<TrucksAndDocuments> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: DriverAppBar(
          text: 'Trucks & Documents',
        ),
        body: Column(
          children: [
            TabBar(
                indicator: MD2Indicator(
                  indicatorSize: MD2IndicatorSize.full,
                  indicatorHeight: 8.0,
                  indicatorColor: darkBlue,
                ),
                unselectedLabelColor: Colors.grey,
                labelColor: darkBlue,
                tabs: [
                  Tab(
                    text: 'Trucks',
                  ),
                  Tab(
                    text: 'Documents',
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                Trucks(),
                Container(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class Trucks extends StatefulWidget {
   Trucks({Key key}) : super(key: key);

  @override
  State<Trucks> createState() => _TrucksState();
}

class _TrucksState extends State<Trucks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding10,
      color: fieldColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: trucksInfo('All Trucks',"2",0)),
              sbw(10),
              Expanded(
                  flex: 3,
                  child: trucksInfo('Available Trucks',"1",1)),
              sbw(10),
              Expanded(
                  flex: 3,
                  child: trucksInfo('Trucks On Trip',"1",2)),
            ],
          ),
          sbh(20),
          Fields.search(
            fillColor: Colors.white,
            hint: 'Search by Truck Number',
          ),
          sbh(10),
          truckDetails('KL 10 AK 3318','On Trip'),
        ],
      ),
    );
  }
Widget truckDetails(String number,status){
    int length=number.length;
    var lastFour=number[length-4]+number[length-3]+number[length-2]+number[length-1];
    var numberFirst=number.replaceAll(lastFour, '');
    return InkWell(
      onTap: (){
        Get.to(VehicleDetails());
      },
      child: Container(
        padding: padding10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(numberFirst,style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.w500
                    ),),
                    sbw(5),
                    Text(lastFour,style: TextStyle(
                        color: Colors.blue,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
                sbh(10),
                Container(
                  height: 25,width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: darkBlue
                  ),
                  child: Center(child: Text('Own',style: TextStyle(color: Colors.white),)),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 5,
                      backgroundColor:darkBlue,),
                    sbw(5),
                    Text(status),
                  ],
                ),
                sbh(10),
                Row(
                  children: [
                    Text('Delhi',style: TextStyle(
                        color: Colors.grey
                    ),),
                    sbw(10),
                    Icon(Icons.arrow_forward_outlined,color: Colors.grey,size: 15,),
                    sbw(10),
                    Text('Ponnepadam',style: TextStyle(
                        color: Colors.grey
                    ),),
                  ],
                ),
              ],
            ),
            sbw(20),
            Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey,),
          ],
        )
      ),
    );
}
int selectedIndex=0;

  Widget trucksInfo(trucks,number,int i) {
    return InkWell(
      onTap: (){
        selectedIndex=i;
        setState((){});
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: selectedIndex==i?Colors.blue:border),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              trucks,
              style: TextStyle(fontSize: 12,color:selectedIndex==i?Colors.blue: Colors.grey),
            ),
             Text(number,style: TextStyle(
               color: Colors.black,
               fontSize: 17,fontWeight: FontWeight.w500
             ),)
          ],
        ),
      ),
    );
  }
}
