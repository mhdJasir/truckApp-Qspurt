import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Constants/TextStyles.dart';

import '../../../Widgets/CustomButton.dart';

class SelectDate extends StatefulWidget {
  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateFormat format = DateFormat('dd MMM yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding10,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: initial != null && last != null,
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(FontAwesomeIcons.calendar),
                    ],
                  ),
                  sbw(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date Range",
                        style: Styles.gs14,
                      ),
                      sbh(5),
                      Text(
                        '$initial - $last',
                        style: Styles.gw500s12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sbh(5),
            CustomButton(
              text: initial != null && last != null
                  ? 'Change Date Range'
                  : "Choose Date Range",
              color: Colors.white,
              onTap: () {
                buildShowModalBottomSheet('Select Start Date', callback: (val) {
                  initial = format.format(val);
                  setState(() {});
                  print(initial);
                }, callBack2: () {
                  buildShowModalBottomSheet(
                    'Select End Date',
                    callback: (val) {
                      last = format.format(val);
                      setState(() {});
                    },
                    callBack2: () {},
                  );
                });
              },
            ),
            sbh(20),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                        child: Divider(
                  thickness: 2,
                ))),
                sbw(10),
                Text(
                  "OR",
                  style: Styles.g600w5s16,
                ),
                sbw(10),
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
              ],
            ),
            sbh(40),
            Text(
              'Choose Months',
              style: Styles.gw500s16,
            ),
            sbh(20),
            checkBoxTile1('December 2021', '(3 trips)'),
            checkBoxTile2('May 2021', '    (1 trips)'),
            sbh(50),
          ],
        ),
      ),
    );
  }

  Future buildShowModalBottomSheet(
    text, {
    callBack2,
    callback,
  }) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: height(context) * 0.8),
        context: context,
        builder: (c) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      padding: basicPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(text, style: Styles.bw5s18),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: height(context) * 0.58,
                      child: SfDateRangePicker(
                        maxDate: DateTime.now(),
                        onSelectionChanged: (val) {
                          callback(val.value);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Button(
                        text: 'Confirm',
                        onTap: () {
                          Get.back();
                          callBack2();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  var initial;
  var last;
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
