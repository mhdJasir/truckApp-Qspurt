import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:get/get.dart';
import 'package:truckapp/Model/NotificationModel.dart';
import 'package:truckapp/Model/Preferences.dart';
import 'package:truckapp/Screens/HomeScreen.dart';

class OtpPage extends StatefulWidget {
  OtpPage({@required this.phoneNumber,@required this.verificationId});
  var phoneNumber;
  final verificationId;
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final focusNode=FocusNode();
  final controller=TextEditingController();
  bool resentOtp=false;
  int seconds=58;
  var time=0;
  @override
  void initState() {
    NotificationModel().initialize();
    _autoFill();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(time!=58) {
        seconds = seconds - 1;
        time = time +1;
        setState(() {});
      }
      else{
        resentOtp=true;
      }
    });
    super.initState();
  }
  _autoFill()async{
    await SmsAutoFill().listenForCode;
  }
  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  void dispose() {
    Timer(Duration(seconds: 0),(){}).cancel();
    super.dispose();
  }
  var pin="";
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        body: SafeArea(
          child: Container(
            padding: basicPadding,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 70,backgroundColor: fieldColor,),
                  sbh(70),
                  Container(
                    padding: EdgeInsets.all(20),
                    color: fieldColor,
                    height: 70,
                    child: PinPut(
                      fieldsCount: 6,
                      focusNode: focusNode,
                      controller: controller,
                      withCursor: true,
                      textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                      eachFieldWidth: 40,
                      eachFieldHeight: 70,
                      submittedFieldDecoration: _pinPutDecoration,
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration,
                      pinAnimationType: PinAnimationType.fade,
                      onChanged: (val){
                        pin=val;
                        setState(() { });
                      },
                    ),
                    // child: PinFieldAutoFill(
                    //   controller: controller,
                    //     focusNode: focusNode,
                    //     onCodeChanged: (val){
                    //     print(val);
                    //     },
                    //     onCodeSubmitted: (val)async{
                    //     print(val);
                    //      await verifyOtp(val);
                    //     },
                    // ),
                  ),
                  sbh(10),
                  Visibility(
                    visible: !resentOtp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('resentOtpIN'.tr,style: TextStyle(
                            color: lowOpWhite,fontSize: 13
                        ),),
                        sbw(10),
                        Text("00:$seconds\s",style: TextStyle(color: lowOpWhite
                            ,fontSize: 17,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: resentOtp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){}, child: Text("resentOtp".tr,style:
                        TextStyle(color: lowOpWhite),)),
                      ],
                    ),
                  ),
                  Button(onTap: ()async{
                    await verifyOtp(pin);
                  }, text: 'Submit'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  verifyOtp(val)async{
    loading=true;
    setState(() { });
    try {
      AuthCredential credential= PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: pin);
      await _auth
          .signInWithCredential(credential)
          .then((value) async {
        if (value.user != null) {
          await NotificationModel.periodicNotification(
            payLoad: 'payLoad',
            body: 'Your Login will expire in 2 days',
            title: 'Expiring soon',
          );
          await Preferences.setUserLogin();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return HomeScreen();
              }));
        }
      });
    } catch (e) {
      Navigator.pop(context);
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid OTP")));
    }
    loading=false;
    setState(() { });
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5.0),
    );
  }
}
