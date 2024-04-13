/*
**********Project Name: attendance_qr
**********File Name: store_user_data
**********Created At: 07-Apr-24 3:03 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:attendance_qr/main.dart';

storeUserData(String userId, userName, userEmail, userPassword) async {
  sharedPreferences?.setString("userId", userId);
  sharedPreferences?.setString("userName", userName);
  sharedPreferences?.setString("userEmail", userEmail);
  sharedPreferences?.setString("userPassword", userPassword);
}