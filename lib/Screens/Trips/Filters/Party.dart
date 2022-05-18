


import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/TextStyles.dart';

class Party extends StatefulWidget {
  const Party({Key key}) : super(key: key);

  @override
  _PartyState createState() => _PartyState();
}

class _PartyState extends State<Party> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          checkBoxTile1('Vijash Kinfra', '(4 trips)'),
          sbh(280),
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
                sbw(10),
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
