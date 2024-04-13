/*
**********Project Name: attendance_qr
**********File Name: course_field
**********Created At: 01-Apr-24 2:05 PM
**********Author: Abdelrhman Hussein
**********Description: Display student's courses and scan button.
*/

import 'package:attendance_qr/Core/Utils/app_colors.dart';
import 'package:attendance_qr/Core/Utils/app_icons.dart';
import 'package:attendance_qr/student_pages/presentation/widgets/qr_scanner/qr_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentCourseField extends StatelessWidget {
  const StudentCourseField(
      {super.key, required this.courseName, required this.courseCode, required this.doctorName});

  final String courseName, courseCode, doctorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        color: AppColors.orangeColor,
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
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              Text(
                doctorName,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              qrScanner(context);
            },
            child: SvgPicture.asset(AppIcons.scan),
          ),
        ],
      ),
    );
  }
}
