import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Components/Simple%20Field.dart';

import '../../../../Constants/ColorConstants.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/TextStyles.dart';

class Party extends StatelessWidget {
   Party({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding10,
      padding: padding10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vijash Kinfra",
                    style: TextStyle(color: Colors.grey),
                  ),
                  sbh(10),
                  Row(
                    children: [
                      Text(
                        "KL 10 AR",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "1188",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: lowOpWhite),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\u20B9250",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    sbw(10),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
          sbh(10),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delhi"),
                  sbh(5),
                  Text(
                    "03 Dec 2021",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
              sbw(10),
              SizedBox(
                width: 55,
                child: Divider(
                  thickness: 1.4,
                ),
              ),
              sbw(5),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: border, width: 2)),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.grey[400],
                ),
              ),
              sbw(5),
              SizedBox(
                width: 55,
                child: Divider(
                  thickness: 1.4,
                ),
              ),
              sbw(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Delhi"),
                  sbh(5),
                  Text(
                    "03 Dec 2021",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          sbh(4),
          Container(
            padding: padding10,
            child: Row(
              children: [
                buildDot(selected: true),
                buildDot(),
                buildDot(),
                buildDot(),
                buildDot(last: true),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                buildText('Started', true),
                sbw(20),
                buildText('Completed', false),
                sbw(10),
                buildText('POD\n Received', false),
                sbw(15),
                buildText('POD\n Submitted', false),
                sbw(20),
                buildText('Settled', false),
              ],
            ),
          ),
          sbh(8),
          Row(
            children: [
              Expanded(
                child: buildButton(
                    color: Colors.white,
                    text: 'Complete Trip',
                    borderColor: buttonGreen,
                    textColor: buttonGreen,
                    onTap: () {}),
              ),
              sbw(10),
              Expanded(
                child: buildButton(
                    color: darkBlue,
                    text: 'View Bill',
                    borderColor: darkBlue,
                    textColor: Colors.white,
                    onTap: () {}),
              ),
            ],
          ),
          sbh(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Freight Amount',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Text(
                    "\u20B9250",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  sbw(20),
                  InkWell(
                    onTap: () {
                      updateFreight();
                    },
                    child: Icon(
                      FontAwesomeIcons.pen,
                      size: 15,
                    ),
                  ),
                  sbw(10)
                ],
              ),
            ],
          ),
          sbh(10),
          buildContainer("(-) Advance", "Add Advance"),
          buildContainer("(+) Charges", "Add Charges"),
          buildContainer("(-) Payments", "Add Payments"),
          Row(
            children: [
              for (int i = 0; i < 21; i++)
                Row(
                  children: [
                    SizedBox(
                        width: 10,
                        child: Divider(
                          thickness: 1.7,
                        )),
                    sbw(5),
                  ],
                ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5, right: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pending Balance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  "\u20B9250",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: medBlue),
                ),
              ],
            ),
          ),
          sbh(10),
          Container(
            padding: padding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 20,
                    ),
                    sbw(20),
                    Text(
                      "Note",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: medBlue),
                    )
                  ],
                ),
                Container(
                  padding: padding10,
                  height: 35,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: darkBlue),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    "Request Money",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  updateFreight() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        context: Get.context,
        builder: (c) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: basicPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Update Freight Amount", style: Styles.bw5s18),
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
                    sbh(10),
                    Container(
                      padding: padding10,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Billing Type',style: Styles.gs14,),
                              sbw(10),
                              Icon(
                                Icons.info_outline_rounded,
                              )
                            ],
                          ),
                          sbh(20),
                          Row(
                            children: [
                              Expanded(child: buttons('Fixed', 0, setState)),
                              Expanded(child: buttons('Per Tonne', 1, setState)),
                              Expanded(child: buttons('Per KG', 2, setState)),
                              Expanded(child: buttons('More', 3, setState)),
                            ],
                          ),
                          sbh(20),
                          Fields(
                            label: 'Total Freight Amount',
                            suffix: Padding(
                              padding: const EdgeInsets.all(15),
                              child: FaIcon(FontAwesomeIcons.rupeeSign,size: 15,),
                            ),
                          ),
                          sbh(50),
                          Button(text: 'Save', onTap: (){},),
                          sbh(20)
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
  int currentIndex=0;
  Widget buttons(text, int i, setState) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            currentIndex = i;
            setState(() {});
          },
          child: Container(
            constraints: BoxConstraints(minWidth: 70),
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
      ],
    );
  }

  Widget buildText(text, bool selected) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: selected ? Colors.black : Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w500),
    );
  }

  Widget buildContainer(text, text2) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 45, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              sbh(5),
              Text(
                text2,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text("\u20B90")
        ],
      ),
    );
  }

  Widget buildButton({color, text, onTap, borderColor, textColor}) {
    return Container(
      height: 45,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        onPressed: onTap,
      ),
    );
  }

  Widget buildDot({bool last = false, bool selected = false}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: selected ? buttonGreen : Colors.grey,
          child: selected
              ? Center(
                  child: Icon(
                  Icons.done,
                  size: 10,
                  color: Colors.white,
                ))
              : Container(),
        ),
        Visibility(
            visible: !last, child: SizedBox(width: 55, child: Divider())),
      ],
    );
  }
}
