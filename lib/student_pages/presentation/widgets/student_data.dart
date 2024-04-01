/*
**********Project Name: attendance_qr
**********File Name: student_data
**********Created At: 01-Apr-24 3:07 PM
**********Author: Abdelrhman Hussein
**********Description: Display student data.
*/

import 'package:attendance_qr/auth_pages/presentation/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Core/Styles/dividers.dart';
import '../../../Core/Utiles/app_colors.dart';
import '../../../Core/Utiles/app_icons.dart';

class StudentData extends StatelessWidget {
  const StudentData({super.key, required this.studentName, required this.studentId});

  final String studentName, studentId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.orangeColor,
                child: SvgPicture.asset(
                  AppIcons.person,
                ),
              ),
              spaceHiresontal8(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    studentName,
                    style: TextStyle(
                      color: AppColors.orangeColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    studentId,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.redColor,
              child: SvgPicture.asset(
                AppIcons.logOut,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
