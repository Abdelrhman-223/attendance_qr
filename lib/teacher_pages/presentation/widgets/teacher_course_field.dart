/*
**********Project Name: attendance_qr
**********File Name: course_field
**********Created At: 01-Apr-24 2:05 PM
**********Author: Abdelrhman Hussein
**********Description: Display student's courses and scan button.
*/

import 'package:attendance_qr/Core/Styles/dividers.dart';
import 'package:attendance_qr/Core/Utils/app_colors.dart';
import 'package:attendance_qr/Core/Utils/app_icons.dart';
import 'package:attendance_qr/teacher_pages/presentation/pages/course_attendance.dart';
import 'package:attendance_qr/teacher_pages/presentation/widgets/qr_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TeacherCourseField extends StatelessWidget {
  const TeacherCourseField({super.key, required this.courseName, required this.courseCode});

  final String courseName, courseCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                courseCode,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    CourseAttendance(
                      courseName: courseName,
                      courseCode: courseCode,
                    ),
                  );
                },
                child: SvgPicture.asset(AppIcons.group),
              ),
              spaceHiresontal16(),
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    QrViewer(
                      courseName: courseName,
                    ),
                  );
                },
                child: SvgPicture.asset(AppIcons.qrCode),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
