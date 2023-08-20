import 'package:flutter/material.dart';
import 'package:law_app/core/constants/colors.dart';

class LawContainer extends StatelessWidget {
  const LawContainer({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorApp.primary,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class LawerDetails {
  List<String> names = [
    " مجدي منصور ",
    "  امال ",
  ];
  List<String> phones = [
    "+201007711997",
    "+213661802512",
  ];
  List<String> sudia_names = [
    "ديان مصلي ",
    "ابراهيم الرشيد ",
    "تركي الشمري  ",
    "   عبد العزيز الرشودي  محامي وموثق كاتب عدل \n  سابق ومستشار بالداخليه ",
  ];
  List<String> sudia_phone = [
    "966551001881",
    "+966555223711",
    "+966566770888",
    "+966503497383",
  ];
  List<String> kuait_names = [
    "حصة العبيد",
    '  علي الصابري ',
  ];
  List<String> kuait_phones = [
    "0096599996441",
    '+96567777222',
  ];
  List<String> imarat_names = [
    "سليمان الشلبي ",
    'عبدالرحمن بو خلف الحمادي',
  ];
  List<String> imarat_phones = [
    "+971554377712",
    '+971503811883',
  ];
}
