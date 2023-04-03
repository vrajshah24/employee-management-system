import 'package:employee_management_system/database/local/model/Employee.dart';
import 'package:employee_management_system/database/local/services/EmployeeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

import '../colors.dart';
import '../responsive.dart';
import 'home.dart';

class SingleEmployee extends StatefulWidget {
  const SingleEmployee({super.key, required this.id});
  final int id;
  @override
  State<SingleEmployee> createState() => _SingleEmployeeState();
}

class _SingleEmployeeState extends State<SingleEmployee> {
  var employeeData;
  List<dynamic> dataList = [];
  getData() async {
    employeeData = await EmployeeDatabase.fetchbyId(widget.id);
    var dob =
        DateFormat('dd MMM yyyy').format(DateTime.parse(employeeData['edob']));
    // var joining_dt = DateFormat('dd MMM yyy')
    //     .format(DateTime.parse(employeeData['ejoining_dt']));
    // dataList.add(['Name', employeeData['ename']]);
    dataList.add(['Date of Birth', dob]);
    dataList.add(['Address', employeeData['eaddress']]);
    // dataList.add(
    //   ['Joining Date', joining_dt],
    // );
    dataList.add(['Code', employeeData['ecode']]);
    dataList.add(['Mobile No', employeeData['emobile_no']]);
    dataList.add(['Bank Account No', employeeData['ebank_acc_no']]);
    dataList.add(['Qualification', employeeData['equalification']]);
    dataList.add(['Salary', employeeData['esalary']]);
    dataList.add(['Position', employeeData['eposition']]);
    dataList.add(['Username', employeeData['eusername']]);
    dataList.add(['Password', employeeData['epassword']]);
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
                      Text('Employee Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16 * getResponsiveText(context))),
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
                padding: EdgeInsets.all(15),
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
                      height: 0.7 * getHeight(context),
                      child: ListView.separated(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text(
                                dataList[index][0] + ' : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16 * getResponsiveText(context)),
                              ),
                              Text(dataList[index][1])
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20 * getResponsive(context),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 0.45 * getWidth(context),
                          height: 55 * getResponsive(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor),
                          child: Center(
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18 * getResponsiveText(context)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            EmployeeDatabase.delete(employeeData['eid'] as int);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },
                            ));
                          },
                          child: Container(
                            width: 0.45 * getWidth(context),
                            height: 55 * getResponsive(context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red),
                                color: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize:
                                          18 * getResponsiveText(context)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
