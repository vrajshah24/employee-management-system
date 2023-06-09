import 'package:employee_management_system/database/local/services/AdminService.dart';
import 'package:employee_management_system/screens/addAdmin.dart';
import 'package:employee_management_system/screens/addEmployee.dart';
import 'package:employee_management_system/screens/adminListing.dart';
import 'package:employee_management_system/screens/employeeListing.dart';
import 'package:employee_management_system/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../responsive.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int id = 0;
  var user;
  getUser() async {
    SharedPreferences.getInstance().then((value) {
      id = value.getInt('id') as int;
    }).then((value) async {
      user = await AdminDatabase.fetchbyId(id);
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: secondaryColor,
          height: getHeight(context),
          width: getWidth(context),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0 * getResponsive(context),
                    right: 10 * getResponsive(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: descColor,
                    ),
                    InkWell(
                      onTap: () {
                        SharedPreferences.getInstance().then((value) {
                          value.setInt('id', 0);
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const Login();
                          },
                        ));
                      },
                      child: Icon(
                        LineIcons.powerOff,
                        color: descColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: getHeight(context) * 0.12,
            ),
            Container(
                height: getHeight(context) * 0.88,
                width: getWidth(context),
                decoration: BoxDecoration(
                    color: descColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30 * getResponsive(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Hi   ${user['name']},',
                            style: GoogleFonts.tangerine(
                                fontWeight: FontWeight.w600,
                                fontSize: 32 * getResponsiveText(context)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20 * getResponsive(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return AddEmployee();
                                },
                              ));
                            },
                            child: Card(
                              color: x,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              elevation: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: x,
                                    borderRadius: BorderRadius.circular(25)),
                                height: 160,
                                width: getWidth(context) * 0.40,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Image.asset(
                                      'assets/addEmployee.png',
                                      height: 80,
                                      // alignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Text('Add Employee')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const EmployeeListing();
                                },
                              ));
                            },
                            child: Card(
                              color: x,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              elevation: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: x,
                                    borderRadius: BorderRadius.circular(25)),
                                height: 160,
                                width: getWidth(context) * 0.40,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Image.asset(
                                      'assets/viewEmployee.png',
                                      height: 80,
                                      // alignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Text('View Employee List')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40 * getResponsive(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return AddAdmin();
                                },
                              ));
                            },
                            child: Card(
                              color: x,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              elevation: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: x,
                                    borderRadius: BorderRadius.circular(25)),
                                height: 160,
                                width: getWidth(context) * 0.40,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Image.asset(
                                      'assets/addAdmin.png',
                                      height: 80,
                                      // alignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Text('Add Admin')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const AdminListing();
                                },
                              ));
                            },
                            child: Card(
                              color: x,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              elevation: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: x,
                                    borderRadius: BorderRadius.circular(25)),
                                height: 160,
                                width: getWidth(context) * 0.40,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Image.asset(
                                      'assets/viewAdmin.png',
                                      height: 80,
                                      alignment: Alignment.center,
                                    ),
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Text('View Admin List')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        )
      ],
    ));
  }
}
