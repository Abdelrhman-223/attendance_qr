/*
**********Project Name: attendance_qr
**********File Name: student_home
**********Created At: 01-Apr-24 1:47 PM
**********Author: Abdelrhman Hussein
**********Description: Will display the student data and scan barcode.
*/

import 'package:attendance_qr/student_pages/presentation/widgets/student_course_field.dart';
import 'package:attendance_qr/student_pages/presentation/widgets/student_data.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const StudentData(
              studentName: "Mohamed Ahmed",
              studentId: "ID: 41245045",
            ),
            Container(
              height: MediaQuery.of(context).size.height - 120,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => const StudentCourseField(
                  courseName: "Course Name",
                  courseCode: "CMP000",
                  doctorName: "Doctor Name",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
