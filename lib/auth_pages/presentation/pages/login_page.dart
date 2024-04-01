/*
**********Project Name: attendance_qr
**********File Name: login_page
**********Created At: 31-Mar-24 2:47 PM
**********Author: Abdelrhman Hussein
**********Description: This page will contain the login form.
*/
import 'package:flutter/material.dart';
import 'package:attendance_qr/Core/Styles/dividers.dart';
import 'package:attendance_qr/Core/Utiles/app_colors.dart';
import 'package:attendance_qr/auth_pages/presentation/widgets/login_tap_button.dart';
import 'package:attendance_qr/auth_pages/presentation/widgets/text_field.dart';

import '../widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login as",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 36,
                  ),
                ),
                spaceVertical32(),
                TabBar(
                  dividerHeight: 0,
                  labelColor: AppColors.whiteColor,
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
                  onTap: (value) {
                    setState(() {
                      tabIndex = value;
                    });
                  },
                  tabs: [
                    Tab(
                      child: LoginTapButton(
                        buttonTitle: "Student",
                        buttonColor: AppColors.orangeColor,
                        activeButton: (tabIndex == 0) ? true : false,
                      ),
                    ),
                    Tab(
                      child: LoginTapButton(
                        buttonTitle: "Teacher",
                        buttonColor: AppColors.blueColor,
                        activeButton: (tabIndex == 1) ? true : false,
                      ),
                    )
                  ],
                ),
                spaceVertical32(),
                FormTextField(
                  fieldController: userNameController,
                  fieldTitle: "User Name",
                  fieldColor: (tabIndex == 0) ? AppColors.orangeColor : AppColors.blueColor,
                  isPasswordField: false,
                ),
                spaceVertical16(),
                FormTextField(
                  fieldController: passwordController,
                  fieldTitle: "Password",
                  fieldColor: (tabIndex == 0) ? AppColors.orangeColor : AppColors.blueColor,
                  isPasswordField: true,
                ),
                spaceVertical32(),
                LoginButton(
                  buttonTitle: "Login",
                  buttonColor: AppColors.blackColor,
                  userType: (tabIndex == 0) ? "student": "teacher",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
