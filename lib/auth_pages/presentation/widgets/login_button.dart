/*
**********Project Name: attendance_qr
**********File Name: login_button
**********Created At: 01-Apr-24 1:43 PM
**********Author: Abdelrhman Hussein
**********Description: This code to write the functions and display of the login button.
*/

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../Core/Utils/app_colors.dart';
import 'package:attendance_qr/auth_pages/data/data_sources/get_data.dart';
import 'package:attendance_qr/student_pages/presentation/pages/student_home.dart';
import 'package:attendance_qr/teacher_pages/presentation/pages/teacher_home.dart';

import '../../data/data_sources/store_user_data.dart';

class LoginButton extends StatefulWidget {
  const LoginButton(
      {super.key,
      required this.buttonTitle,
      required this.buttonColor,
      required this.userType,
      required this.userEmail,
      required this.userPassword});

  final String buttonTitle, userType, userEmail, userPassword;
  final Color buttonColor;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetDataForLogin>(

        /// Create the builder of the state management to get the message from the controller.
        init: GetDataForLogin(),
        builder: (loginController) {
          return GestureDetector(
            onTap: () async {
              if (widget.userType == "student") {
                /// first calling the function that get the data from firebase.
                await loginController.getStudentsData();

                /// after that searching about the user email and password according the user type.
                for (int i = 0; i < loginController.studentsData.length; i++) {
                  if (widget.userEmail == loginController.studentsData[i]["studentEmail"]) {
                    if (widget.userPassword == loginController.studentsData[i]["studentPassword"]) {
                      storeUserData(
                        loginController.studentsData[i].id,
                        loginController.studentsData[i]["studentName"],
                        loginController.studentsData[i]["studentEmail"],
                        loginController.studentsData[i]["studentPassword"],
                      );
                      Get.off(() => const StudentHomePage());
                    } else {
                      loginController.wrongPassword();
                    }

                    /// Break to end the search after finding the email even if the password is wrong
                    break;
                  } else {
                    loginController.wrongEmail();
                  }
                }
              } else if (widget.userType == "teacher") {
                /// first calling the function that get the data from firebase.
                await loginController.getTeachersData();

                /// after that searching about the user email and password according the user type.
                for (int i = 0; i < loginController.teachersData.length; i++) {
                  if (widget.userEmail == loginController.teachersData[i]["teacherEmail"]) {
                    if (widget.userPassword == loginController.teachersData[i]["teacherPassword"]) {
                      storeUserData(
                        loginController.teachersData[i].id,
                        loginController.teachersData[i]["teacherName"],
                        loginController.teachersData[i]["teacherEmail"],
                        loginController.teachersData[i]["teacherPassword"],
                      );
                      Get.off(() => const TeacherHomePage());
                    } else {
                      loginController.wrongPassword();
                    }

                    /// Break to end the search after finding the email even if the password is wrong
                    break;
                  } else {
                    loginController.wrongEmail();
                  }
                }
              }
            },

            /// this code to generate the button body.
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: widget.buttonColor,
                ),
                borderRadius: BorderRadius.circular(50),
                color: widget.buttonColor,
              ),
              child: Text(
                widget.buttonTitle,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          );
        });
  }
}
