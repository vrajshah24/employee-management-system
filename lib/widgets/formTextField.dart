import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors.dart';
import '../responsive.dart';

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

class SelectDate extends StatefulWidget {
  const SelectDate({super.key, required this.onChanged, required this.label});
  final String label;
  final ValueChanged<Map<String, dynamic>> onChanged;
  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime? pickedDate = DateTime.now();
  String formattedDate = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate = widget.label;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        pickedDate = await showDatePicker(
            context: context,
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: primaryColor, // header background color
                      onPrimary: textColor, // header text color
                      onSurface: primaryColor, // body text color
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        primary: primaryColor, // button text color
                      ),
                    )),
                child: child!,
              );
            },
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime.now());

        if (pickedDate != null) {
          setState(() {
            formattedDate = DateFormat('dd MMM yyyy').format(pickedDate!);
          });
        }
        Map<String, dynamic> date = {
          'formattedDate': formattedDate,
          'actualDate': pickedDate,
        };
        widget.onChanged(date);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            height: 55 * getResponsive(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(
                      fontSize: 12 * getResponsiveText(context),
                      color: Colors.grey),
                ),
                const Icon(Icons.arrow_drop_down_rounded)
              ],
            ),
          ),
          SizedBox(
            height: 20 * getResponsive(context),
          )
        ],
      ),
    );
  }
}
