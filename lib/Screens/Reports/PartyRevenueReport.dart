

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../Constants/ColorConstants.dart';
import '../../Constants/Constants.dart';
import '../../Widgets/AppBar.dart';

class PartyRevenueReport extends StatefulWidget {
  const PartyRevenueReport({Key key}) : super(key: key);

  @override
  State<PartyRevenueReport> createState() => _PartyRevenueReportState();
}

class _PartyRevenueReportState extends State<PartyRevenueReport> {
  List months = [];
  var selectedIndex = 0;
  var selectedDate;
  var dateFormat = DateFormat('MMM-yyyy');
  getList() {
    for (int i = 12; i >= 0; i--) {
      var value = dateFormat.format(DateTime(2021, i));
      months.add(value);
    }
    setState(() {});
  }
  @override
  void initState() {
    getList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DriverAppBar(text: 'Party Revenue Report'),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: padding10,
              height: 80,
              color: lightBg,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      sbw(10),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              constraints: BoxConstraints(maxHeight: height(context)*0.85),
                              enableDrag: true,
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )),
                              builder: (c) {
                                return StatefulBuilder(
                                  builder: (context, void Function(void Function()) setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding: basicPadding,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Choose Month',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                              IconButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.3,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 20,right: 20,),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height(context)*0.65,
                                                child: ListView.separated(
                                                  separatorBuilder: (c, i) {
                                                    return Divider(
                                                      thickness: 1.3,
                                                    );
                                                  },
                                                  itemCount: months.length,
                                                  itemBuilder: (c, i) {
                                                    return InkWell(
                                                      onTap: (){
                                                        selectedIndex=i;
                                                        selectedDate=months[selectedIndex];
                                                        setState(() { });
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(months[i]),
                                                          Radio(
                                                            value: i,
                                                            groupValue:
                                                            selectedIndex,
                                                            onChanged: (val){
                                                              selectedIndex=i;
                                                              selectedDate=months[selectedIndex];
                                                              setState(() { });
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }).then((value) => setState((){}));
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey[300])),
                            child: Center(
                                child: Row(
                                  children: [
                                    Text(selectedDate??'Dec-2021'),
                                    sbw(10),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      sbw(30),
                      Container(
                        padding: padding10,
                        height: 45,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.fileExcel,
                              color: Colors.green,
                            ),
                            sbw(10),
                            Text(
                              'Download Excel',
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sbh(10),
            Container(
              padding: basicPadding,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 45,
                    decoration: BoxDecoration(
                      color: bg2,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5, child: buildText("Party/Customer Name")),
                        Expanded(
                            flex: 2, child: Center(child: buildText("Trips"))),
                        Expanded(
                            flex: 4,
                            child: Center(child: buildText("Month's Revenue"))),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.white,
                    padding: padding10,
                    child: Row(
                      children: [
                        Expanded(flex: 5, child: buildText("Vijas Kinfra")),
                        Expanded(flex: 2, child: Center(child: buildText("2"))),
                        Expanded(
                            flex: 4,
                            child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildText("\u20B92600"),
                                    sbw(15),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    )
                                  ],
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    decoration: BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: buildText("Total", color: Colors.white)),
                        Expanded(
                            flex: 2,
                            child: Center(
                                child: buildText("2", color: Colors.white))),
                        Expanded(
                            flex: 4,
                            child: Center(
                                child: buildText("\u20B92600",
                                    color: Colors.white))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildText(text, {color}) {
    return Text(
      text,
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: color),
    );
  }
}
