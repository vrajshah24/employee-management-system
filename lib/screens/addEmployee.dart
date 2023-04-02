// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
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
                  boxShadow: [
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
                      textfield('Patient ID', 'Patient ID', 1, patientId),
                      textfield('Name', 'Name', 1, name),
                      textfield('Age', 'Age', 1, age),
                      textfield(
                          'Doctor' 's Name', 'Doctor' 's Name', 1, doctorName),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: DropdownButton(
                            isExpanded: true,
                            value: selectedGender,
                            items: gender.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                      fontSize: 14 * getResponsive(context)),
                                ),
                              );
                            }).toList(),
                            underline: const SizedBox.shrink(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value as String;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * getResponsive(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Past Cardiac History'),
                          Switch(
                            value: cardiacHistory,
                            activeColor: secondaryColor,
                            onChanged: (value) {
                              setState(() {
                                cardiacHistory = !cardiacHistory;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20 * getResponsive(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('High Blood Pressure'),
                          Switch(
                            activeColor: secondaryColor,
                            value: hbp,
                            onChanged: (value) {
                              setState(() {
                                hbp = !hbp;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20 * getResponsive(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Low Blood Pressure'),
                          Switch(
                            activeColor: secondaryColor,
                            value: lbp,
                            onChanged: (value) {
                              setState(() {
                                lbp = !lbp;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20 * getResponsive(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Diabetes'),
                          Switch(
                            activeColor: secondaryColor,
                            value: diabetes,
                            onChanged: (value) {
                              setState(() {
                                diabetes = !diabetes;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20 * getResponsive(context),
                      ),
                      InkWell(
                        onTap: () async {
                          if (form.currentState!.validate()) {
                            User user = User(
                                patient_id: patientId.text,
                                name: name.text,
                                age: age.text,
                                gender: selectedGender,
                                dr_name: doctorName.text,
                                cardiac_history: checkBoolean(cardiacHistory),
                                hbp: checkBoolean(hbp),
                                lbp: checkBoolean(lbp),
                                diabetes: checkBoolean(diabetes));
                            var res = await UserDatabase.create(user);
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
