/*
**********Project Name: attendance_qr
**********File Name: text_field
**********Created At: 31-Mar-24 2:56 PM
**********Author: Abdelrhman Hussein
**********Description: This code to present the form text field and it takes the controller, field title and border color.
*/

import 'package:flutter/material.dart';
import 'package:attendance_qr/Core/Utiles/app_colors.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32,),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: fieldColor,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
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
      ),
    );
  }
}
