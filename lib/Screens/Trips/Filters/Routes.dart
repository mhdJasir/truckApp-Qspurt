import 'package:flutter/material.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';

import '../../../Constants/TextStyles.dart';

class Routes extends StatefulWidget {
  Routes({Key key}) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding10,
      child: Column(
        children: [
          Fields(
            prefix: Icon(Icons.search),
            fillColor: fieldColor,
            hint: 'Search for a city',
          ),
          checkBoxTile1('Calicut to university of calicut', '(3 trips)'),
          checkBoxTile1('Delhi to Kashmir', '(3 trips)'),
          sbh(200),
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
                SizedBox(width: 120, child: Text(text)),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    text2,
                    style: Styles.gs14,
                  ),
                )
              ],
            ))
      ],
    );
  }
}
