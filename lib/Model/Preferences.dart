import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future setUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
  }
  static Future<bool> checkIsLogin() async {
    bool isLogin;
    SharedPreferences prefs = await SharedPreferences.getInstance();
   isLogin= prefs.getBool('isLogin')??false;
   return isLogin;
  }
  static Future logoutUser() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.remove('isLogin');
  }
}
