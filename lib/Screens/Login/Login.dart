import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:truckapp/Components/Button.dart';
import 'package:truckapp/Constants/ColorConstants.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Driver/DriverHome.dart';
import 'package:truckapp/Screens/Login/OtpScreen.dart';
import '../../Components/Simple Field.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Truck"),
          centerTitle: true,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                  itemBuilder: (c) {
                    return languages.map((e) {
                      return PopupMenuItem(
                          value: e['locale'], child: Text(e['name']));
                    }).toList();
                  },
                  onSelected: (value) {
                    Get.updateLocale(Locale('$value'));
                  },
                ),
              ],
            ),
          ],
        ),
        body: Container(
          padding: basicPadding,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.redAccent,
                  ),
                  sbh(20),
                  textFields(context,
                      controller: mobileNumber, hintText: "Mobile number"),
                  sbh(20),
                  Button(
                      onTap: () async {
                        loading = true;
                        setState(() {});
                        if (mobileNumber.text.length == 10) {
                          await _auth.verifyPhoneNumber(
                              phoneNumber: "+91${mobileNumber.text}",
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {
                                Fluttertoast.showToast(msg: e.message ?? "");
                                loading = false;
                                setState(() {});
                              },
                              codeSent:
                                  (String verificationId, int resendToken) {
                                verificationCode = verificationId;
                                loading = false;
                                setState(() {});
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return OtpPage(
                                      phoneNumber: mobileNumber.text,
                                      verificationId: verificationCode);
                                }));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {
                                verificationCode = verificationId;
                                setState(() {});
                              });
                        }
                      },
                      text: 'Login'),
                  sbh(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Existing customer?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  buildButton(
                      text: "Driver Login",
                      onTap: () => Get.to(() => DriverHome()),
                      color: buttonGreen),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  var verificationCode;
  final mobileNumber = TextEditingController();
}
