import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LawersRow extends StatelessWidget {
  const LawersRow(
      {super.key,
      required this.name,
      required this.phone,
      required this.country});
  final String name;
  final String phone;
  final String country;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: ExactAssetImage("images/lawer.jpg"),
              ),
              Text(name),
              Text(phone),
              Text(country)
            ],
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
