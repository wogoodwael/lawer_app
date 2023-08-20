import 'package:flutter/material.dart';
import 'package:law_app/core/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  String? _isEmpty;

  CustomTextField(
      {super.key,
      required this.text,
      required this.hint_text,
      required this.icon,
      required this.controller,
      this.sufixIcon});
  final String text;
  final String hint_text;
  final IconData icon;
  final TextEditingController controller;
  Widget? sufixIcon;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: ColorApp.text_color),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
             
                suffixIcon: sufixIcon,
                prefixIcon: Icon(icon, color: ColorApp.primary),
                border: InputBorder.none,
                hintText: hint_text,
                hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 126, 126, 126), fontSize: 15)),
          ),
        ),
      ]),
    );
  }

  String? validate(value) {
    return _isEmpty = "can not be empty";
  }
}
