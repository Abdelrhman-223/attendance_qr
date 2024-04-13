/*
**********Project Name: attendance_qr
**********File Name: get_data
**********Created At: 07-Apr-24 10:23 AM
**********Author: Abdelrhman Hussein
**********Description: Get user data from firebase to log in.
*/

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataForLogin extends GetxController {

  List<QueryDocumentSnapshot> teachersData = [], studentsData = [];
  String loginMessage = "", messageFrom = "";

  getTeachersData() async {
    // Get Teacher's data.
    QuerySnapshot teachersShot = await FirebaseFirestore.instance.collection("teachers").get();
    teachersData.addAll(teachersShot.docs);
    update();
  }

  getStudentsData() async {
    // Get Student's data.
    QuerySnapshot studentsShot = await FirebaseFirestore.instance.collection("students").get();
    studentsData.addAll(studentsShot.docs);
    update();
  }

  wrongEmail(){
    loginMessage = "Email is not correct";
    messageFrom = "email";
    update();
  }
  wrongPassword(){
    loginMessage = "Password is not correct";
    messageFrom = "password";
    update();
  }
  clearMessage(){
    loginMessage = "";
    messageFrom = "";
    update();
  }
}