import 'package:employee_management_system/database/local/services/EmployeeService.dart';
import 'package:employee_management_system/screens/addAdmin.dart';
import 'package:employee_management_system/screens/addEmployee.dart';
import 'package:employee_management_system/screens/adminListing.dart';
import 'package:employee_management_system/screens/employeeListing.dart';
import 'package:employee_management_system/screens/singleEmployee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../responsive.dart';
import 'login.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  late int id;
  var user;
  getUser() async {
    SharedPreferences.getInstance().then((value) {
      id = value.getInt('id') as int;
    }).then((value) async {
      user = await EmployeeDatabase.fetchbyId(id);
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    setState(() {});
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
                            'Hi, ${user['ename']},',
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
                                  return SingleEmployee(
                                    id: user['eid'],
                                  );
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
                                width: getWidth(context) * 0.90,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10 * getResponsive(context),
                                    ),
                                    Image.asset(
                                      'assets/mydetails.png',
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                      // alignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      height: 20 * getResponsive(context),
                                    ),
                                    Text('My Details')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        )
      ],
    ));
  }
}
