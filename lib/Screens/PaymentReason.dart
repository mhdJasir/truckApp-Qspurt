import 'package:flutter/material.dart';
import 'package:truckapp/Components/Simple%20Field.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';

class PaymentReason extends StatefulWidget {
  const PaymentReason({Key key}) : super(key: key);

  @override
  _PaymentReasonState createState() => _PaymentReasonState();
}

class _PaymentReasonState extends State<PaymentReason> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fieldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sbh(20),
              Fields(
                prefix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.close),
                ),
                hint: 'Driver Got Reasons',
              ),
              greyTile("Recently Used"),
              whiteTile("Trip Advance",),
              greyTile("Recommended reasons"),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (c,i){
                  return Container(
                      color: Colors.white,
                      child: divider());
                },
                itemCount: list.length,
                itemBuilder: (c,i){
                  return whiteTile(list[i]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
List list=['Trip Payment','Party Advance','Party Payment','Driver Payment'];
  Widget divider() {
    return Center(
      child: Container(
        color: Colors.white,
        width: width(context)-20,
        child: Divider(
          thickness: 1.5,
        ),
      ),
    );
  }

  Widget whiteTile(text) {
    return Container(
      height: 60,
      width: width(context),
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: padding10,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget greyTile(text) {
    return Container(
      height: 50,
      padding: padding10,
      alignment: Alignment.centerLeft,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }
}
