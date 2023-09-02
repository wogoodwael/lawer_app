import 'package:countries_flag/countries_flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law_app/core/constants/colors.dart';

class RowCountries extends StatelessWidget {
  const RowCountries(
      {super.key, required this.flagName, required this.countryname, required this.ontap});
  final String flagName;
  final String countryname;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              child: CountriesFlag(
                flagName,
                height: 50,
                fit: BoxFit.cover,
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              countryname,
              style: TextStyle(
                  color: ColorApp.text_color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
