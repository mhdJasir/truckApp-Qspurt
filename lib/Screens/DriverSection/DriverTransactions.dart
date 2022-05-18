import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:truckapp/Components/DatePicker.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import '../../../Widgets/Button.dart';
import '../../Components/Button.dart';
import '../../Widgets/Button.dart';
import '../PaymentReason.dart';

class DriverTransactions extends StatefulWidget {
  const DriverTransactions({Key key}) : super(key: key);

  @override
  _DriverTransactionsState createState() => _DriverTransactionsState();
}

class _DriverTransactionsState extends State<DriverTransactions> {
  final dateController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fieldColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.grey[700],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Laundery 131",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            sbh(5),
            Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: darkGreen,
                ),
                sbw(5),
                Text(
                  'Available',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 13),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              sbw(5),
              PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.black,
                  ),
                  onSelected: (val) {},
                  itemBuilder: (c) {
                    return [''].map((e) {
                      return PopupMenuItem(value: e, child: Text(e));
                    }).toList();
                  }),
              sbw(5),
            ],
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sbh(5),
            Container(
              padding: basicPadding,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Collect from driver",
                            style: TextStyle(color: Colors.grey),
                          ),
                          sbw(5),
                          Text(
                            "\u20B9100",
                            style: TextStyle(
                                color: darkGreen,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          )
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: borderRadius5),
                        child: Center(
                          child: Text(
                            'Settle Amount',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sbh(20),
                  Row(
                    children: [
                      Expanded(
                        child: smallButton(
                            onTap: () {},
                            color: buttonColor3,
                            text: 'View Report',
                            icon: Icon(
                              FontAwesomeIcons.solidFilePdf,
                              color: Colors.blue,
                            )),
                      ),
                      sbw(10),
                      Expanded(
                        child: smallButton(
                            onTap: () {},
                            color: buttonColor2,
                            text: 'Send Money',
                            icon: Icon(
                              FontAwesomeIcons.telegramPlane,
                              color: darkBlue,
                            )),
                      ),
                    ],
                  ),
                  sbh(5),
                ],
              ),
            ),
            Container(
              height: 40,
              padding: padding10,
              child: buildRow("REASON", "DRIVER GAVE", "DRIVER GOT"),
            ),
            Container(
              padding: padding10,
              color: Colors.white,
              child: Column(
                children: [
                  buildRow2("Union Charges", '08 Dec', "100", null),
                  buildRow2("Trip Payment", '08 Dec', null, "200", last: true),
                ],
              ),
            ),
            sbh(20),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                smallButton(
                  text: 'Driver Gave',
                  color: Colors.red,
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  onTap: (){
                    addCash("Reduce Driver Balance (-)");
                  }
                ),
                smallButton(
                  text: 'Driver Got',
                  color: darkGreen,
                    textColor: Colors.white,
                    icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onTap: (){
                    addCash("Add Driver Balance (+)");
                  },
                ),
              ],
            ),
            sbh(20),
          ],
        ),
      ),
    );
  }

  Future addCash(text){
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxHeight: height(context)*0.7
        ),
        context: context, builder: (c){
      return StatefulBuilder(
        builder: (context,Function(Function()) setState) {
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
                      Text(text,style: TextStyle(
                          color: Colors.black,fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),),
                      InkWell(
                          onTap: ()=>Navigator.maybePop(context),
                          child: Icon(Icons.close,color: Colors.grey,size: 25,))
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
                          )
                      ),
                      sbh(20),
                      Fields.datePick(
                          fillColor: fieldColor,
                          label: 'Reason',
                          suffix: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        onTap: (){
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
                        onTap: (){
                          pickDate(context,setDate: (val){
                            print(val);
                            dateController.text=val;
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
                        child: Text("Optional",style: TextStyle(color: Colors.grey),),
                      ),
                      sbh(20),
                      Button(
                        text: 'Confirm',
                        onTap: (){
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
  Widget buildRow2(title, subTitle, text2, text3, {bool last = false}) {
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
            sbw(20),
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

  Widget buildRow(text1, text2, text3) {
    return Row(
      children: [
        Expanded(flex: 4, child: buildText(text1)),
        sbw(20),
        Expanded(flex: 3, child: buildText(text2)),
        sbw(20),
        Expanded(flex: 3, child: buildText(text3)),
      ],
    );
  }

  Widget buildText(text) => Text(
        text,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      );

}
