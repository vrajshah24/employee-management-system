import 'package:employee_management_system/screens/addEmployee.dart';
import 'package:flutter/material.dart';

import 'screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    routes: {'/': (context) => SplashScreen()},
  ));
}
