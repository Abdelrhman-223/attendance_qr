/*
**********Project Name: attendance_qr
**********File Name: course_field
**********Created At: 01-Apr-24 2:05 PM
**********Author: Abdelrhman Hussein
**********Description: Display student's courses and scan button.
*/

import 'package:attendance_qr/Core/Utils/app_colors.dart';
import 'package:attendance_qr/Core/Utils/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttendStudentField extends StatelessWidget {
  const AttendStudentField({super.key, required this.studentName, required this.studentId});

  final String studentName, studentId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
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
                studentName,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                studentId,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SvgPicture.asset(AppIcons.check),
        ],
      ),
    );
  }
}
