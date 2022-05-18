import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:truckapp/Constants/TextStyles.dart';

import '../../../Components/Button.dart';
import '../../../Components/DatePicker.dart';
import '../../../Components/Simple Field.dart';
import '../../../Constants/ColorConstants.dart';
import '../../../Constants/Constants.dart';
import '../../../Widgets/Button.dart';
import '../../PaymentReason.dart';

class Driver extends StatefulWidget {
  const Driver({Key key}) : super(key: key);

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: fieldColor,
      child: Column(
        children: [
          Container(
            height: 70,
            margin: padding10,
            padding: padding10,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: borderRadius10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.car,
                      size: 15,
                    ),
                    sbw(10),
                    Text(
                      "Prageen",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                    ),
                    sbw(10),
                    Text(
                      'On Trip',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 100,
            padding: basicPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button('View Report', skyBlue, FontAwesomeIcons.filePdf),
                button(
                    'Send Money', lowOpWhite, FontAwesomeIcons.telegramPlane),
              ],
            ),
          ),
          Container(
            height: 40,
            padding: padding10,
            child: Row(
              children: [
                Expanded(child: buildText("REASON")),
                buildText("DRIVER GAVE"),
                sbw(30),
                buildText("DRIVER GOT"),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: padding10,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        buildRow("Union Charges", '08 Dec', "100", null),
                        buildRow(
                          "Trip Payment",
                          '08 Dec',
                          null,
                          "200",
                        ),
                        buildRow("Union Charges", '08 Dec', "100", null),
                        buildRow("Trip Payment", '08 Dec', null, "200",
                            last: true),
                        sbh(50),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        smallButton(
                            color: Colors.redAccent,
                            onTap: () {
                              addCash("Reduce Driver Balance (-)");
                            },
                            text: 'Driver Gave',
                            icon: Icon(Icons.remove),
                            textColor: Colors.white),
                        smallButton(
                            color: darkGreen,
                            onTap: () {
                              addCash("Add Driver Balance (+)");
                            },
                            text: 'Driver Got',
                            icon: Icon(Icons.add),
                            textColor: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final dateController = TextEditingController();

  Future addCash(text) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: height(context) * 0.7),
        context: context,
        builder: (c) {
          return StatefulBuilder(
            builder: (context, Function(Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: basicPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          InkWell(
                              onTap: () => Navigator.maybePop(context),
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                                size: 25,
                              ))
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: basicPadding,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Fields(
                              fillColor: fieldColor,
                              label: 'Amount',
                              suffix: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_drop_down),
                              )),
                          sbh(20),
                          Fields.datePick(
                            fillColor: fieldColor,
                            label: 'Reason',
                            suffix: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_drop_down),
                            ),
                            onTap: () {
                              Get.to(PaymentReason());
                            },
                          ),
                          sbh(20),
                          Fields.datePick(
                            controller: dateController,
                            fillColor: fieldColor,
                            label: 'Date',
                            suffix: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(FontAwesomeIcons.calendar),
                            ),
                            onTap: () {
                              pickDate(context, setDate: (val) {
                                print(val);
                                dateController.text = val;
                                setState(() {});
                              });
                            },
                          ),
                          sbh(20),
                          Fields(
                            label: 'Note',
                            fillColor: fieldColor,
                            prefix: Icon(Icons.sort),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Optional",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          sbh(20),
                          Button(
                            text: 'Confirm',
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget buildRow(title, subTitle, text2, text3, {bool last = false}) {
    return Column(
      children: [
        sbh(10),
        Row(
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    sbh(10),
                    buildText(subTitle)
                  ],
                )),
            sbw(70),
            Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    text2 != null ? '-\u20B9$text2' : '',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                )),
            sbw(20),
            Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    text3 != null ? '\u20B9$text3' : '',
                    style: TextStyle(
                        color: darkGreen,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                )),
          ],
        ),
        sbh(20),
        Visibility(
          visible: !last,
          child: SizedBox(
            width: width(context) - 40,
            child: Divider(
              thickness: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Text buildText(text) => Text(
        text,
        style: Styles.gw500s12,
      );

  Widget button(text, color, icon) {
    return Container(
      height: 70,
      width: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FaIcon(
            icon,
            color: darkBlue,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
