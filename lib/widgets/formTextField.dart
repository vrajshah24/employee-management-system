import 'package:flutter/material.dart';

import '../colors.dart';

textfield(String labelText, String hintText, int isRequired,
    TextEditingController controller) {
  return Column(
    children: [
      TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
            color: Color(
              0xff495057,
            ),
            fontSize: 12),
        validator: (value) {
          if (isRequired == 1) {
            if (value == null || value.isEmpty) {
              return "$labelText Required";
            }
          }
          return null;
        },
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE63946), width: 1),
              borderRadius: BorderRadius.circular(10)),
          errorStyle: const TextStyle(fontSize: 9),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 11),
          contentPadding: const EdgeInsets.all(10),
          // labelText: "$labelText *",
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.white10)),
          filled: true,
          fillColor: Colors.white70,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          floatingLabelStyle: TextStyle(color: primaryColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}

textfieldforNumbers(String labelText, String hintText, int isRequired,
    TextEditingController controller, int maxLength) {
  return Column(
    children: [
      TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
            color: Color(
              0xff495057,
            ),
            fontSize: 12),
        validator: (value) {
          if (isRequired == 1) {
            if (value == null || value.isEmpty) {
              return "$labelText Required";
            }
          }
          return null;
        },
        decoration: InputDecoration(
          counterStyle: TextStyle(
            height: double.minPositive,
          ),
          counterText: "",
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE63946), width: 1),
              borderRadius: BorderRadius.circular(10)),
          errorStyle: const TextStyle(fontSize: 9),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 11),
          contentPadding: const EdgeInsets.all(10),
          labelText: "$labelText *",
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xffBBC2C9))),
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          floatingLabelStyle: TextStyle(color: primaryColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}
