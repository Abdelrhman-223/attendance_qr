/*
**********Project Name: attendance_qr
**********File Name: text_field
**********Created At: 31-Mar-24 2:56 PM
**********Author: Abdelrhman Hussein
**********Description: This code to present the form text field and it takes the controller, field title and border color.
*/

import 'package:attendance_qr/auth_pages/data/data_sources/get_data.dart';
import 'package:flutter/material.dart';
import 'package:attendance_qr/Core/Utils/app_colors.dart';
import 'package:get/get.dart';

import '../manager/login_text_fields_controller.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({super.key,
    required this.fieldController,
    required this.fieldTitle,
    required this.fieldColor,
    required this.isPasswordField,
  });

  final TextEditingController fieldController;
  final String fieldTitle;
  final Color fieldColor;
  final bool isPasswordField;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginTextFieldsController>(
      init: LoginTextFieldsController(),
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 32,),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: fieldColor,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: GetBuilder(
            init: GetDataForLogin(),
            builder: (messageController) {
              return TextField(
                controller: fieldController,
                obscureText: isPasswordField,
                cursorColor: fieldColor,
                style: TextStyle(
                  fontSize: 20,
                  color: fieldColor,
                ),
                decoration: InputDecoration(
                  hintText: fieldTitle,
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.blackColor.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  messageController.clearMessage();
                  (isPasswordField)?
                  controller.getUserPassword(fieldController.text):
                  controller.getUserEmail(fieldController.text);

                },
              );
            }
          ),
        );
      }
    );
  }
}
