import 'package:flutter/material.dart';
import 'package:truckapp/Constants/ColorConstants.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/TextStyles.dart';

class TripStatus extends StatefulWidget {
  const TripStatus({Key key}) : super(key: key);

  @override
  _TripStatusState createState() => _TripStatusState();
}

class _TripStatusState extends State<TripStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            checkBoxTile1('December 2021', '(3 trips)'),
            checkBoxTile2('May 2021', '    (1 trips)'),
            sbh(250),
          ],
        ),
      ),
    );
  }

  bool date1 = false;
  bool date2 = false;

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

  Widget checkBoxTile2(text, text2) {
    return Row(
      children: [
        Checkbox(
            value: date2,
            onChanged: (val) {
              date2 = val;
              setState(() {});
            }),
        InkWell(
            onTap: () {
              date2 = !date2;
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
