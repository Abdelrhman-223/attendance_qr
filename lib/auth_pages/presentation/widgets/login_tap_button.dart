/*
**********Project Name: attendance_qr
**********File Name: login_tap_button
**********Created At: 31-Mar-24 3:26 PM
**********Author: Abdelrhman Hussein
**********Description: This code to create the tap button and it takes title, color and activation.
*/

import 'package:flutter/material.dart';
import 'package:attendance_qr/Core/Utiles/app_colors.dart';

class LoginTapButton extends StatelessWidget {
  const LoginTapButton({super.key, required this.buttonTitle, required this.buttonColor, required this.activeButton});

  final String buttonTitle;
  final Color buttonColor;
  final bool activeButton;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: buttonColor,
        ),
        borderRadius: BorderRadius.circular(50),
        color: (activeButton)?buttonColor:AppColors.whiteColor,
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(
          fontSize: 16,
          color: (!activeButton)?buttonColor:AppColors.whiteColor,
        ),
      ),
    );
  }
}
