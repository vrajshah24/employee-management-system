import 'package:employee_management_system/database/local/model/Admin.dart';
import 'package:employee_management_system/database/local/model/Employee.dart';
import 'package:employee_management_system/database/local/services/AdminService.dart';
import 'package:employee_management_system/database/local/services/EmployeeService.dart';
import 'package:employee_management_system/responsive.dart';
import 'package:employee_management_system/screens/singleEmployee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_icons/line_icons.dart';

import '../colors.dart';

class AdminListing extends StatefulWidget {
  const AdminListing({super.key});

  @override
  State<AdminListing> createState() => _AdminListingState();
}

class _AdminListingState extends State<AdminListing> {
  List<Admin> adminList = [];

  getData() async {
    adminList = await AdminDatabase.fetchAll();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
                      Text(
                        'Admin Listing',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16 * getResponsiveText(context)),
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: getHeight(context) * 0.88,
                width: getWidth(context),
                decoration: BoxDecoration(
                    color: descColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: adminList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SingleEmployee(
                                id: adminList[index].id as int);
                          },
                        ));
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 70 * getResponsive(context),
                          width: getWidth(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Name : '),
                                      Text(adminList[index].name.toString())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Position : '),
                                      Text(adminList[index].position.toString())
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15 * getResponsive(context),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
