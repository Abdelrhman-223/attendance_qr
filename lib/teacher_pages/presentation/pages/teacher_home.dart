/*
**********Project Name: attendance_qr
**********File Name: teacher_home
**********Created At: 01-Apr-24 3:19 PM
**********Author: Abdelrhman Hussein
**********Description: Will display the teacher data courses and course's barcode.
*/

import 'package:flutter/material.dart';
import '../widgets/teacher_course_field.dart';
import '../widgets/teacher_data.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TeacherData(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => const TeacherCourseField(
                  courseName: "Course Name",
                  courseCode: "CMP000",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
