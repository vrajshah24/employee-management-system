// ignore_for_file: use_build_context_synchronously
import 'package:employee_management_system/database/local/services/EmployeeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../database/local/model/Employee.dart';
import '../registeredSuccessfully.dart';
import '../responsive.dart';
import '../widgets/formTextField.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  GlobalKey<FormState> form = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController bankAcc = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late Map<String, dynamic> dobDate;
  late Map<String, dynamic> joiningDate;

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
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(80)),
                    // color: x.withOpacity(0.7),
                    color: descColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 35 * getResponsive(context)),
                  child: Column(
                    children: [
                      textfield('Name', 'Name', 1, name),
                      SelectDate(
                          onChanged: (value) {
                            dobDate = value;
                          },
                          label: "Select DOB"),
                      textfield('Address', 'Address', 1, address),
                      SelectDate(
                          onChanged: (value) {
                            joiningDate = value;
                          },
                          label: "Select Joining Date"),
                      // SelectDate(onChanged: (value) {}),
                      textfield('Employee Code', 'Employee Code', 1, code),
                      textfield('Mobile No', 'Mobile No', 1, mobile),
                      textfield(
                          'Bank Account No', 'Bank Account No', 1, bankAcc),
                      textfield(
                          'Qualification', 'Qualification', 1, qualification),
                      textfield('Salary', 'Salary', 1, salary),
                      textfield('Position', 'Position', 1, position),
                      textfield('Username', 'Username', 1, username),
                      textfield('Password', 'Password', 1, password),
                      InkWell(
                        onTap: () async {
                          if (form.currentState!.validate()) {
                            Employee user = Employee(
                                ename: name.text,
                                edob: dobDate['actualDate'].toString(),
                                eaddress: address.text,
                                ejoining_dt:
                                    joiningDate['actualDate'].toString(),
                                ecode: code.text,
                                emobile_no: mobile.text,
                                ebank_acc_no: bankAcc.text,
                                equalification: qualification.text,
                                esalary: salary.text,
                                eposition: position.text,
                                eusername: username.text,
                                epassword: password.text,
                                estatus: 1);
                            var res = await EmployeeDatabase.insert(user);
                            if (res == "Success") {
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
