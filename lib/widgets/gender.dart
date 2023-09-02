// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Gender extends StatefulWidget {
  late bool ontap = false;
  late bool ontapfemal = false;
  Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  void toggleSwitch(bool value) {
    if ( widget. ontap == false) {
      setState(() {
      widget.  ontap = true;
        // textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
      widget.  ontap = false;
        // textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchFemal(bool value2) {
    if (widget. ontapfemal == false) {
      setState(() {
     widget.   ontapfemal = true;
        // textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
      widget.  ontapfemal = false;
        // textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.ontap;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Switch(
            activeColor: Color(0xff5c9895),
            value:widget. ontap,
            onChanged: toggleSwitch),
        Text('7'.tr),
        Switch(
            activeColor: Color(0xff5c9895),
            value:widget. ontapfemal,
            onChanged: toggleSwitchFemal),
        Text('8'.tr),
      ],
    );
  }
}
