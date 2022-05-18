import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Widgets/PdfView.dart';

import '../Constants/Constants.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/CustomIndicator/CustomIndicator.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key key}) : super(key: key);

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List months = [];
  var dateFormat = DateFormat('MMM-yyyy');
  var currentIndex;
  var currentMonth;
  getList() {
    var now = DateTime.now();
     currentMonth = dateFormat.format(now);
    for (int i = 12; i >= 0; i--) {
      var value = dateFormat.format(DateTime(2021, i));
      months.add(value);
      if (value.contains(currentMonth)) {
        currentIndex = i;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DriverAppBar(
          text: 'Expenses',
          statusBarColor: darkGreen,
          centerText: true,
        ),
        body: Column(
          children: [
            Divider(
              thickness: 1.3,
            ),
            Container(
              padding: basicPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Visibility(
                              visible: currentIndex>1,
                              child: dateAdjust(icon: Icons.arrow_back_ios,
                              onTap: (){
                                if(currentIndex>1) {
                                  currentIndex--;
                                }
                                print(currentIndex);
                                setState(() { });
                              })),
                          sbw(10),
                          Text(months[12 - currentIndex]),
                          sbw(10),
                          Visibility(
                              visible: currentMonth!=months[12 - currentIndex],
                              child: dateAdjust(icon: Icons.arrow_forward_ios,
                              onTap: (){
                                if(currentIndex<12) {
                                  currentIndex++;
                                }
                                setState(() { });
                              })),
                        ],
                      ),
                      sbh(10),
                      Text(
                        "\u20B90",
                        style: TextStyle(
                            color: darkBlue,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(PdfView());
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: skyBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.filePdf,
                            color: darkBlue,
                          ),
                          Text(
                            'View Report',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.blue,
                isScrollable: true,
                indicator: MD2Indicator(
                  indicatorSize: MD2IndicatorSize.full,
                  indicatorHeight: 8.0,
                  indicatorColor: darkBlue,
                ),
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: 'Truck Expense',
                  ),
                  Tab(
                    text: 'Trip Expense',
                  ),
                  Tab(
                    text: 'Office Expense',
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                buildTabBarView("No Truck Expense", 'Add Truck Expense'),
                buildTabBarView('No Trip Expense', 'Add Trip Expense'),
                buildTabBarView('No Office Expense', 'Add office Expense'),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget dateAdjust({onTap,icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: lightBg,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sbw(5),
            Icon(
              icon,
              color: Colors.grey,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }

  Container buildTabBarView(text, buttonText) {
    return Container(
      color: lightBg,
      child: Column(
        children: [
          sbh(height(context) * 0.3),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          sbh(20),
          SizedBox(
              width: width(context) * 0.8,
              child: Text(
                'You have not added any Truck Expense for this month',
                textAlign: TextAlign.center,
              )),
          sbh(50),
          Center(
            child: SizedBox(
                width: width(context) * 0.7,
                child: CustomButton(
                  onPressed: () {},
                  text: buttonText,
                  color: darkGreen,
                )),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({this.onPressed, this.text, this.color});

  final Function() onPressed;
  final String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 12,
              child: Center(
                  child: Icon(
                Icons.add,
                color: darkGreen,
                size: 20,
              )),
            ),
            sbw(10),
            Text(text),
          ],
        ),
      ),
    );
  }
}
