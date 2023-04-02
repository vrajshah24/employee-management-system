import 'package:flutter/material.dart';

import 'screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    routes: {'/': (context) => SplashScreen()},
  ));
}
