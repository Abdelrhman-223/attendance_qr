/*
**********Project Name: attendance_qr
**********File Name: student_data
**********Created At: 01-Apr-24 3:07 PM
**********Author: Abdelrhman Hussein
**********Description: Display student data.
*/

import 'package:attendance_qr/auth_pages/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Core/Styles/dividers.dart';
import '../../../Core/Utils/app_colors.dart';
import '../../../Core/Utils/app_icons.dart';
import '../../../main.dart';

class TeacherData extends StatelessWidget {
  TeacherData({super.key,});

  final String? teacherName = sharedPreferences?.getString("userName")!;

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
                backgroundColor: AppColors.blueColor,
                child: SvgPicture.asset(
                  AppIcons.person,
                ),
              ),
              spaceHiresontal8(),
              Text(
                teacherName!,
                style: TextStyle(
                  color: AppColors.blueColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.off(const LoginPage());
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
