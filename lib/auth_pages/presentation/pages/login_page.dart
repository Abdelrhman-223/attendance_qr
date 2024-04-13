/*
**********Project Name: attendance_qr
**********File Name: login_page
**********Created At: 31-Mar-24 2:47 PM
**********Author: Abdelrhman Hussein
**********Description: This page will contain the login form.
*/
import 'package:attendance_qr/auth_pages/data/data_sources/get_data.dart';
import 'package:flutter/material.dart';
import 'package:attendance_qr/Core/Styles/dividers.dart';
import 'package:attendance_qr/Core/Utils/app_colors.dart';
import 'package:attendance_qr/auth_pages/presentation/widgets/login_tap_button.dart';
import 'package:attendance_qr/auth_pages/presentation/widgets/text_field.dart';
import 'package:get/get.dart';

import '../manager/login_text_fields_controller.dart';
import '../widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userEmailController = TextEditingController();
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
            /// column to create the login page body.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // page title
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
                GetBuilder(
                    init: GetDataForLogin(),
                    builder: (messageController) {
                      return Column(
                        children: [
                          FormTextField(
                            fieldController: userEmailController,
                            fieldTitle: "User Name",
                            fieldColor:
                                (tabIndex == 0) ? AppColors.orangeColor : AppColors.blueColor,
                            isPasswordField: false,
                          ),
                          (messageController.messageFrom == "email" &&
                                  messageController.loginMessage != "")
                              ? Text(
                                  messageController.loginMessage,
                                  style: TextStyle(
                                    color: AppColors.redColor,
                                  ),
                                )
                              : const Text(""),
                          spaceVertical16(),
                          FormTextField(
                            fieldController: passwordController,
                            fieldTitle: "Password",
                            fieldColor:
                                (tabIndex == 0) ? AppColors.orangeColor : AppColors.blueColor,
                            isPasswordField: true,
                          ),
                          (messageController.messageFrom == "password" &&
                                  messageController.loginMessage != "")
                              ? Text(
                                  messageController.loginMessage,
                                  style: TextStyle(
                                    color: AppColors.redColor,
                                  ),
                                )
                              : const Text(""),
                        ],
                      );
                    }),
                spaceVertical32(),
                GetBuilder<LoginTextFieldsController>(
                  init: LoginTextFieldsController(),
                  builder: (controller) => LoginButton(
                    buttonTitle: "Login",
                    buttonColor: AppColors.blackColor,
                    userType: (tabIndex == 0) ? "student" : "teacher",
                    userEmail: controller.userEmail,
                    userPassword: controller.userPassword,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
