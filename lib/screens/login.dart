import 'package:employee_management_system/database/local/services/AdminService.dart';
import 'package:employee_management_system/database/local/services/EmployeeService.dart';
import 'package:employee_management_system/screens/adminHome.dart';
import 'package:employee_management_system/screens/employeeHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../responsive.dart';
import '../widgets/formTextField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

List groupList = ['Admin', 'Employee'];
bool isLogin = true;
TextEditingController adminUsername = TextEditingController();
TextEditingController adminPassword = TextEditingController();
TextEditingController employeeUsername = TextEditingController();
TextEditingController employeePassword = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            color: secondaryColor,
            height: getHeight(context),
            width: getWidth(context),
            child: Column(
              children: const [
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 90 * getResponsive(context),
              ),
              Image.asset(
                'assets/login.png',
                height: 200 * getResponsive(context),
              ),
              Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24 * getResponsiveText(context)),
              ),
              SizedBox(
                height: 30 * getResponsive(context),
              ),
              Container(
                height: getHeight(context) * 0.65,
                width: getWidth(context),
                decoration: BoxDecoration(
                    color: descColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20 * getResponsive(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isLogin = true;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isLogin
                                      ? Colors.orange.shade200
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20)),
                              // width: 0.2 * getWidth(context),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 35 * getResponsive(context),
                                  vertical: 10 * getResponsive(context)),
                              child: Center(child: Text('Admin')),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20 * getResponsive(context),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isLogin = false;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: !isLogin
                                      ? Colors.orange.shade200
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20)),
                              // width: 0.2 * getWidth(context),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25 * getResponsive(context),
                                  vertical: 10 * getResponsive(context)),
                              child: Center(child: Text('Employee')),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.05 * getHeight(context),
                    ),
                    Visibility(
                      visible: isLogin,
                      replacement: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35 * getResponsive(context)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30 * getResponsive(context),
                            ),
                            textfield(
                                'Username', 'Username', 1, employeeUsername),
                            textfield(
                                'Password', 'Password', 1, employeePassword),
                            SizedBox(
                              height: 40 * getResponsive(context),
                            ),
                            InkWell(
                              onTap: () async {
                                int res = await EmployeeDatabase.login(
                                    employeeUsername.text,
                                    employeePassword.text);
                                print(res);
                                if (res != 0) {
                                  SharedPreferences.getInstance()
                                      .then((value) async {
                                    await value.setInt('id', res);
                                    await value.setInt('role', 2);
                                  });
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const EmployeeHome();
                                    },
                                  ));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 60 * getResponsive(context),
                                width: getWidth(context) * 0.8,
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35 * getResponsive(context)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30 * getResponsive(context),
                            ),
                            textfield('Username', 'Username', 1, adminUsername),
                            textfield('Password', 'Password', 1, adminPassword),
                            SizedBox(
                              height: 40 * getResponsive(context),
                            ),
                            InkWell(
                              onTap: () async {
                                int res = await AdminDatabase.login(
                                    adminUsername.text, adminPassword.text);
                                print(res);
                                if (res != 0) {
                                  SharedPreferences.getInstance()
                                      .then((value) async {
                                    await value.setInt('id', res);
                                    await value.setInt('role', 1);
                                  });
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const AdminHome();
                                    },
                                  ));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 60 * getResponsive(context),
                                width: getWidth(context) * 0.8,
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
