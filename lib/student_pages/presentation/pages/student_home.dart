/*
**********Project Name: attendance_qr
**********File Name: student_home
**********Created At: 01-Apr-24 1:47 PM
**********Author: Abdelrhman Hussein
**********Description: Will display the student data and scan barcode.
*/

import 'package:attendance_qr/student_pages/data/data_sources/get_student_courses.dart';
import 'package:attendance_qr/student_pages/presentation/widgets/student_course_field.dart';
import 'package:attendance_qr/student_pages/presentation/widgets/student_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GetStudentCourses> (
          init: GetStudentCourses(),
          initState: (state) async {
            await GetStudentCourses().getStudentCoursesData();
          },
          builder: (coursesController) {
            return Column(
              children: [
                const StudentData(),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: ListView.builder(
                    itemCount: coursesController.courses.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      print(coursesController.courses[index]["courseName"]);
                      return StudentCourseField(
                      courseName: coursesController.courses[index]["courseName"],
                      courseCode: coursesController.courses[index].id,
                      doctorName: "Doctor Name",
                    );
                    },
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
