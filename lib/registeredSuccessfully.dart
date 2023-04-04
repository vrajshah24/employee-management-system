import 'package:employee_management_system/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'screens/adminHome.dart';

registeredSuccessfully(context) {
  late FocusNode myFocusNode;
  myFocusNode = FocusNode();
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            content: Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 300 * getResponsive(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/done.png',
                        height: 150 * getResponsive(context),
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        height: 30 * getResponsive(context),
                      ),
                      Text(
                        'Registered Successfully',
                        style: TextStyle(
                            fontSize: 20 * getResponsiveText(context),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40 * getResponsive(context),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        width: 160 * getResponsive(context),
                        height: 40 * getResponsive(context),
                        child: TextButton(
                          focusNode: myFocusNode,
                          autofocus: true,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const AdminHome();
                              },
                            ));
                            // Navigator.pop(context);
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      });
}
