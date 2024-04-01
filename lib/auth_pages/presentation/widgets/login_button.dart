/*
**********Project Name: attendance_qr
**********File Name: login_button
**********Created At: 01-Apr-24 1:43 PM
**********Author: Abdelrhman Hussein
**********Description: This code to write the functions and display of the login button.
*/

import 'package:attendance_qr/student_pages/presentation/pages/student_home.dart';
import 'package:attendance_qr/teacher_pages/presentation/pages/teacher_home.dart';
import 'package:flutter/material.dart';
import '../../../Core/Utiles/app_colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, required this.buttonTitle, required this.buttonColor, required this.userType});

  final String buttonTitle, userType;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  (userType == "student") ? const StudentHomePage() : const TeacherHomePage(),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: buttonColor,
          ),
          borderRadius: BorderRadius.circular(50),
          color: buttonColor,
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
