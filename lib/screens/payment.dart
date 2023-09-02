// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law_app/core/constants/colors.dart';
import 'package:law_app/widgets/buttons.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key, this.price});
  int? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.text_color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: ColorApp.text_color,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.check_circle,
              color: Colors.greenAccent,
              size: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              " ${'18'.tr} ${price} ${'22'.tr}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "11800000769607",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtons(
              text: '19'.tr,
              color: Colors.white,
              text_color: ColorApp.text_color,
              onpress: () => Navigator.pushReplacementNamed(context, 'Images'),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ],
      ),
    );
  }
}
