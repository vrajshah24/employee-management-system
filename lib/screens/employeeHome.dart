import 'package:employee_management_system/screens/addAdmin.dart';
import 'package:employee_management_system/screens/addEmployee.dart';
import 'package:employee_management_system/screens/adminListing.dart';
import 'package:employee_management_system/screens/employeeListing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../colors.dart';
import '../responsive.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
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
                    Icon(
                      LineIcons.bell,
                      color: descColor,
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
                            'Hi  Vraj ,',
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
                                    Image.asset(
                                      'assets/heartbeat.png',
                                      height: 120,
                                      // alignment: Alignment.centerLeft,
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
                                    Image.asset(
                                      'assets/heartbeat.png',
                                      height: 120,
                                      // alignment: Alignment.centerLeft,
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
                                    Image.asset(
                                      'assets/heartbeat.png',
                                      height: 120,
                                      // alignment: Alignment.centerLeft,
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
                                    Image.asset(
                                      'assets/heartbeat.png',
                                      height: 120,
                                      // alignment: Alignment.centerLeft,
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
