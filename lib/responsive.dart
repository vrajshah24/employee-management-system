import 'package:flutter/material.dart';

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getResponsive(context) {
  return MediaQuery.of(context).size.height * 0.001;
}

double getResponsiveText(context) {
  return MediaQuery.of(context).textScaleFactor;
}
