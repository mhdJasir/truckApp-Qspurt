import 'package:flutter/material.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fieldColor,
      appBar: DriverAppBar(
        text: 'Notification Inbox',
        centerText: false,
      ),
      body: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (c, i) {
              return Divider();
            },
            itemCount: notifications.length,
            itemBuilder: (c, i) {
              return listTile(notifications[i]['title'],
                  notifications[i]['subtitle'], notifications[i]['date']);
            },
          )
        ],
      ),
    );
  }

  List notifications = [
    {
      'title': 'Complete Trip & Collect Payment on Time',
      'subtitle': 'Share KL 10 AR 1188 POD with vijash in ! minute',
      'date': 'Dec 10'
    },
    {
      'title': 'Replace Your Khata with TransportBook',
      'subtitle': 'Simply create trips to update your Ledger',
      'date': 'Dec 25'
    },
    {
      'title': 'Complete Trip & Collect Payment on Time',
      'subtitle': 'Share KL 10 AR 1188 POD with vijash in ! minute',
      'date': 'Dec 10'
    },
    {
      'title': 'Replace Your Khata with TransportBook',
      'subtitle': 'Simply create trips to update your Ledger',
      'date': 'Dec 25'
    },
  ];

  Widget listTile(title, subtitle, date) {
    return ListTile(
      onTap: () {},
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle),
      trailing: Text(
        date,
        style: TextStyle(color: Colors.grey, fontSize: 10),
      ),
    );
  }
}
