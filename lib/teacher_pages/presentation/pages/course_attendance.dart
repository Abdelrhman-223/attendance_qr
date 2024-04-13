/*
**********Project Name: attendance_qr
**********File Name: course_attendance
**********Created At: 01-Apr-24 4:24 PM
**********Author: Abdelrhman Hussein
**********Description: Display course attendance with students names and total number.
*/

import 'package:attendance_qr/Core/Styles/dividers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Core/Utils/app_colors.dart';
import '../../../Core/Utils/app_icons.dart';
import '../widgets/attend_student_field.dart';

class CourseAttendance extends StatefulWidget {
  const CourseAttendance({super.key, required this.courseName, required this.courseCode});
  final String courseName, courseCode;

  @override
  State<CourseAttendance> createState() => _CourseAttendanceState();
}

class _CourseAttendanceState extends State<CourseAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.courseName,
                        style: TextStyle(
                          color: AppColors.blueColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.courseCode,
                        style: TextStyle(
                          color: AppColors.blueColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(AppIcons.goBack),
                  ),
                ],
              ),
            ),
            Text(
              "Number of Students: 10",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
              ),
            ),
            spaceVertical16(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 156,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => const AttendStudentField(
                  studentName: "Student Name",
                  studentId: "0120125",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
