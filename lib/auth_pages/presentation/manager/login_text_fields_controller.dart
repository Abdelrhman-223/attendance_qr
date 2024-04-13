/*
**********Project Name: attendance_qr
**********File Name: login_text_fields_controller
**********Created At: 06-Apr-24 5:51 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';

class LoginTextFieldsController extends GetxController {
  String userEmail = "", userPassword = "";
  void getUserEmail(String textFromField){
    userEmail = textFromField;
    update();
  }
  void getUserPassword(String textFromField){
    userPassword = textFromField;
    update();
  }
}