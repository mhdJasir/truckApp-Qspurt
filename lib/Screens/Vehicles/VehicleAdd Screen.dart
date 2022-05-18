import 'package:flutter/material.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class AddVehicles extends StatefulWidget {
  const AddVehicles({Key key}) : super(key: key);

  @override
  _AddVehiclesState createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
  final controller = TextEditingController();
   int selectedIndex;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DriverAppBar(text: "Vehicle",centerText: true,statusBarColor: buttonGreen,),
      body: SafeArea(
        child: Container(
          padding: basicPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sbh(20),
                Text("Add Registration number *",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12),),
                sbh(10),
                Fields(controller: controller, fillColor: fieldColor),
                sbh(10),
                Text("Ex Kl 10 Ak 3318",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12)),
                sbh(20),
                Fields(fillColor: fieldColor,hint: 'Vehicle type',),
                Center(
                  child: SizedBox(
                    width: width(context) - 40,
                    child: Button.submit(
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
