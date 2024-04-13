/*
**********Project Name: attendance_qr
**********File Name: get_student_courses
**********Created At: 08-Apr-24 10:16 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:get/get.dart';
import 'package:attendance_qr/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetStudentCourses extends GetxController {
  List studentCourses = [], courses = [];

  getStudentCoursesData() async {
    // Get Student's data.
    QuerySnapshot studentCoursesShot =
        await FirebaseFirestore.instance.collection("students").get();
    List<QueryDocumentSnapshot> getStudentsShot = [];
    getStudentsShot.addAll(studentCoursesShot.docs);
    for (int i = 0; i < studentCoursesShot.docs.length; i++) {
      if (getStudentsShot[i].id == sharedPreferences?.getString("userId")) {
        studentCourses.add(getStudentsShot[i]["courses"]);
      }
    }
    getCoursesData();
  }

  getCoursesData() async {
    // Get Student's data.
    QuerySnapshot coursesShot = await FirebaseFirestore.instance.collection("courses").get();
    List<QueryDocumentSnapshot> getCoursesShot = [];
    getCoursesShot.addAll(coursesShot.docs);
    for (int j = 0; j < studentCourses[0].length; j++) {
      for (int i = 0; i < getCoursesShot.length; i++) {
        if (getCoursesShot[i].id == studentCourses[0][j]) {
          courses.add(getCoursesShot[i]);
        }
      }
    }
    print(courses[0].id);
    update();
  }

}
