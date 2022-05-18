import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/DropDownWidget.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/TextStyles.dart';

import '../../../Components/Button.dart';
import '../../../Components/DatePicker.dart';
import '../../../Constants/Constants.dart';

class Profit extends StatefulWidget {
  Profit({Key key}) : super(key: key);

  @override
  State<Profit> createState() => _ProfitState();
}

class _ProfitState extends State<Profit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding10,
      padding: padding10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContainer('(+) Revenue', '250', color: Colors.blue),
          Container(
              padding: EdgeInsets.only(top: 10, right: 45, left: 30, bottom: 5),
              child: buildRow('Vijash Kinfra', '250')),
          Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 25, bottom: 20),
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 35),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: fieldColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildRow('Freight Amount', '250'),
                buildRow('Total Charges', '0'),
                buildRow('Total Deductions', '0'),
              ],
            ),
          ),
          buildContainer('(+) Expenses', '0'),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                addExpense();
              },
              child: Text(
                'Add Expense',
                style: TextStyle(
                  color: darkBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          sbh(20),
          Row(
            children: [
              for (int i = 0; i < 21; i++)
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey[300],
                      ),
                    ),
                    sbw(5)
                  ],
                ),
            ],
          ),
          sbh(20),
          Container(
            padding: EdgeInsets.only(left: 15, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profit",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Text(
                  "\u20B9250",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  addExpense() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      backgroundColor: Colors.white,
      constraints: BoxConstraints(
          maxHeight: height(context) * 0.9, minWidth: width(context)),
      isScrollControlled: true,
      context: context,
      builder: (c) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: basicPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Add Expense", style: Styles.bw5s18),
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
                    Container(
                      padding: basicPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropDown(
                            items: [
                              'Travel',
                            ],
                            hint: 'Expense Type',
                            onChanged: (val) {},
                          ),
                          sbh(15),
                          Fields(
                            label: ' Expense Amount',
                          ),
                          sbh(15),
                          Fields.datePick(
                            label: ' Expense Date',
                            onTap: () {
                              pickDate(context, setDate: (date) {});
                            },
                            suffix: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(FontAwesomeIcons.calendar),
                            ),
                          ),
                          sbh(15),
                          Text(
                            'Payment Mode',
                            style: Styles.g600w5s16,
                          ),
                          sbh(15),
                          Row(
                            children: [
                              buttons('Cash', 0, setState),
                              buttons('Credit', 1, setState),
                              buttons('Pay by Driver', 2, setState),
                              buttons('Online', 3, setState),
                            ],
                          ),
                          sbh(20),
                          Row(
                            children: [
                              Checkbox(
                                value: addToPartyBill,
                                onChanged: (val) {
                                  addToPartyBill = val;
                                  setState(() {});
                                },
                              ),
                              InkWell(
                                  onTap: () => setState(() {
                                        addToPartyBill = !addToPartyBill;
                                      }),
                                  child: Text("Add To Party Bill")),
                              sbw(20),
                              Icon(
                                Icons.info_outline_rounded,
                              )
                            ],
                          ),
                          sbh(5),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: borderRadius10,
                                color: fieldColor),
                            padding: basicPadding,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount added to party bill',
                                      style: Styles.gs14,
                                    ),
                                    sbh(5),
                                    Text(
                                      "0",
                                      style: Styles.bw600s15,
                                    )
                                  ],
                                ),
                                Text(
                                  "\u20B9",
                                  style: Styles.gw5,
                                ),
                              ],
                            ),
                          ),
                          sbh(10),
                          Container(
                            height: 50,
                            width: 120,
                            padding: padding10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(color: Colors.black54)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sort,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                                sbw(5),
                                Text(
                                  'Add Note',
                                  style: Styles.blw500s13,
                                )
                              ],
                            ),
                          ),
                          sbh(10),
                          Button(text: 'Save', onTap: () {})
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  bool addToPartyBill = false;

  int currentIndex = 0;

  Widget buttons(text, int i, setState) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            currentIndex = i;
            setState(() {});
          },
          child: Container(
            constraints: BoxConstraints(minWidth: 60),
            padding: padding10,
            decoration: BoxDecoration(
              color: currentIndex == i ? Colors.blue[100] : fieldColor,
              border: currentIndex == i
                  ? Border.all(color: darkBlue, width: 1.5)
                  : Border.all(
                      color: Colors.transparent,
                    ),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Center(child: Text(text, style: Styles.b12)),
          ),
        ),
        sbw(10)
      ],
    );
  }

  Widget buildRow(text1, text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 12),
        ),
        Text("\u20B9$text2")
      ],
    );
  }

  Widget buildContainer(text, text2, {color = Colors.black}) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 45, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            "\u20B9$text2",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
