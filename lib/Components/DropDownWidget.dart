import 'package:flutter/material.dart';
import 'package:truckapp/Constants/TextStyles.dart';

import '../Constants/Constants.dart';


class DropDown extends StatefulWidget {

  DropDown({@required this.items,this.onChanged,this.hint,this.initialValue});
  List items=[];
  Function(String) onChanged;
  String hint,initialValue;
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var selectedValue;
@override
  void initState() {
  selectedValue=widget.initialValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 50,width: width(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(widget.hint,style: Styles.gw5),

          items: widget.items.map((e){
            return DropdownMenuItem(
                value: e,
                child: Text(e));
          }).toList(),
          onChanged: (value) {
            selectedValue=value;
              setState(() {});
            widget.onChanged(value);
          },
          value: selectedValue,
        ),
      ),
    );
  }
}