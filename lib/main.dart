import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:attendance_qr/auth_pages/presentation/pages/login_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB-9aD74xvd8zmqJ_1juDKPKzu-mYqL86c",
      appId: "1:819876469068:android:cf1efb7e22e7079f7c97e9",
      messagingSenderId: "819876469068",
      projectId: "qr-attendance-46b5f",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Qr Attendance',
      home: LoginPage(),
    );
  }
}
