/*
**********Project Name: attendance_qr
**********File Name: qr_viewer
**********Created At: 01-Apr-24 4:48 PM
**********Author: Abdelrhman Hussein
**********Description: Alert to view qr code.
*/

import 'package:attendance_qr/Core/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class QrViewer extends StatelessWidget {
  const QrViewer({super.key, required this.courseName});
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      contentPadding: const EdgeInsets.all(16),
      title: Text(
        courseName,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.blueColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Image.asset("assets/qrcodes/CMP111.png"),
    );
  }
}
