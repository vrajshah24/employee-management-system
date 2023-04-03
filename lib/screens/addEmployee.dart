// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../database/local/model/Employee.dart';
import '../registeredSuccessfully.dart';
import '../responsive.dart';
import '../widgets/formTextField.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController patientId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController doctorName = TextEditingController();
  late Map<String, dynamic> dobDate;
  List gender = ['Male', 'Female', 'Other'];
  String selectedGender = "Male";
  bool cardiacHistory = false;
  bool hbp = false;
  bool lbp = false;
  bool diabetes = false;
  int checkBoolean(bool b) {
    int res = 0;
    if (b == true) {
      res = 1;
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              SizedBox(
                height: 80 * getResponsive(context),
              ),
              Center(
                child: Image.asset(
                  'assets/open_book.png',
                  height: 180 * getResponsive(context),
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 20 * getResponsive(context),
              ),
              Text(
                'Register',
                style: TextStyle(
                    fontSize: 32 * getResponsive(context),
                    color: textColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30 * getResponsive(context),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 6.0,
                        spreadRadius: 4,
                        color: Colors.black26),
                  ],
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(80)),
                  color: x.withOpacity(0.7),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 35 * getResponsive(context)),
                  child: Column(
                    children: [
                      textfield('Name', 'Name', 1, patientId),
                      SelectDate(onChanged: (value) {
                        dobDate = value;
                      }),
                      textfield('Address', 'Name', 1, patientId),
                      textfield('Joining Date', 'Name', 1, patientId),
                      textfield('Employee Code', 'Name', 1, patientId),
                      textfield('Mobile No', 'Name', 1, patientId),
                      textfield('Bank Account No', 'Name', 1, patientId),
                      textfield('Qualification', 'Name', 1, patientId),
                      textfield('Salary', 'Name', 1, patientId),
                      textfield('Position', 'Name', 1, patientId),
                      textfield('Username', 'Name', 1, patientId),
                      textfield('Password', 'Name', 1, patientId),
                      InkWell(
                        onTap: () async {
                          if (form.currentState!.validate()) {
                            // Employee user = Employee();
                            // var res = await UserDatabase.create(user);
                            if ("res" == "Success") {
                              await SharedPreferences.getInstance()
                                  .then((value) {
                                value.setBool('login', true);
                              });
                              registeredSuccessfully(context);
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor),
                          height: 50 * getResponsive(context),
                          width: getWidth(context) * 0.5,
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(color: textColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
