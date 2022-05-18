import 'package:flutter/material.dart';
import 'package:truckapp/Constants/TextStyles.dart';

import '../../../Constants/Constants.dart';

class MyTrucks extends StatefulWidget {
  const MyTrucks({Key key}) : super(key: key);

  @override
  _MyTrucksState createState() => _MyTrucksState();
}

class _MyTrucksState extends State<MyTrucks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Trucks',
            style: Styles.bw5s13,
          ),
          checkBoxTile1('December 2021', '(3 trips)'),
          sbh(250),
        ],
      ),
    );
  }

  bool date1 = false;

  Widget checkBoxTile1(text, text2) {
    return Row(
      children: [
        Checkbox(
            value: date1,
            onChanged: (val) {
              date1 = val;
              setState(() {});
            }),
        InkWell(
            onTap: () {
              date1 = !date1;
              setState(() {});
            },
            child: Row(
              children: [
                Text(text),
                Text(
                  text2,
                  style: Styles.gs14,
                )
              ],
            ))
      ],
    );
  }
}
