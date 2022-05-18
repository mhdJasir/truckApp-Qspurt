import 'package:flutter/material.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/DatePicker.dart';
import 'package:truckapp/Components/DropDownWidget.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Widgets/AppBar.dart';

import '../../Constants/Constants.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({Key key}) : super(key: key);

  @override
  _AddTripState createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  final date = TextEditingController();
  bool newCustomer = true;
  List vehicles = ["Truck", 'Geep', 'Car', "Tempo", 'Lorry'];
  var pickedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(
        text: 'Vehicle Trips',
        centerText: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: basicPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText('Trip date'),
                Fields.datePick(
                  onTap: () {
                    pickDate(context, setDate: (val) {
                      date.text = val;
                      setState(() {});
                    });
                  },
                  controller: date,
                  fillColor: fieldColor,
                ),
                sbh(10),
                buildText('Trip Time'),
                GestureDetector(
                  onTap: () async {
                    var now = DateTime.now();
                    var picked = await showTimePicker(
                      context: context,
                      initialTime:
                          TimeOfDay(hour: now.hour, minute: now.minute),
                    );
                    var value=picked.replacing(hour: picked.hourOfPeriod);
                    var hour=value.hour.toString().padLeft(2,"0");
                    var minute=value.minute.toString().padLeft(2,"0");
                    pickedTime='$hour:$minute';
                    setState(() { });
                  },
                  child: Container(
                    height: 50,
                    width: width(context) - 40,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius5,
                      color: fieldColor,
                    ),
                    child: pickedTime == null ? Container() :
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      child: Text('$pickedTime'),
                    ),
                  ),
                ),
                sbh(10),
                buildText('Trip From'),
                buildField(),
                buildText('Trip To'),
                buildField(),
                buildText('Vehicle'),
                Container(
                  height: 50,
                  color: fieldColor,
                  child: DropDown(
                    items: vehicles,
                    hint: '',
                    onChanged: (val) {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    radioTile(true, "New Customer"),
                    radioTile(false, "Existing Customer"),
                  ],
                ),
                sbh(20),
                Visibility(
                    visible: newCustomer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText('Customer name'),
                        buildField(),
                        buildText('Contact Number'),
                        buildField(),
                      ],
                    )),
                Visibility(
                  visible: !newCustomer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [buildText('Customer Name'), buildField()],
                  ),
                ),
                sbh(20),
                Button.submit(
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget radioTile(value, text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          newCustomer = value as bool;
          setState(() {});
        },
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: newCustomer,
              onChanged: (val) {
                newCustomer = val as bool;
                setState(() {});
              },
            ),
            Column(
              children: [
                sbh(10),
                buildText(text),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField({controller}) {
    return Column(
      children: [
        Fields(
          fillColor: fieldColor,
          controller: controller,
        ),
        sbh(10),
      ],
    );
  }

  Widget buildText(text) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
        sbh(10),
      ],
    );
  }
}
