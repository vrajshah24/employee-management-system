import 'dart:async';

import 'package:employee_management_system/screens/addEmployee.dart';
import 'package:employee_management_system/screens/adminHome.dart';
import 'package:employee_management_system/screens/employeeHome.dart';
import 'package:employee_management_system/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/local/initDb.dart';
import '../database/remote/api.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int id = 0;
  int role = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initdb();
    SharedPreferences.getInstance().then((value) {
      id = value.getInt('id') as int;
      role = value.getInt('role') as int;
      setState(() {});
    });
    Timer(const Duration(seconds: 3), () {
      if (id != 0) {
        if (role == 1) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const AdminHome();
          }));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const EmployeeHome();
          }));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const Login();
        }));
      }
    });
  }

  initdb() async {
    await InitDB.instance.database;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 100,
        ),
      ),
    );
  }
}
