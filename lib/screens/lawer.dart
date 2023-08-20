import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:law_app/screens/payment.dart';
import 'package:law_app/widgets/law_container.dart';

import '../core/constants/colors.dart';

// import '../core/localization/changelocal.dart';

class LawerScreen extends StatelessWidget {
  const LawerScreen({super.key});



  @override
  Widget build(BuildContext context) {
    // LocalController controller = LocalController();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('26'.tr),
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorApp.text_color,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '23'.tr,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              LawContainer(
                  text: 'q1'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 100,
                                )));
                  }),
              const SizedBox(
                height: 15,
              ),
              LawContainer(
                  text: 'q2'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 50,
                                )));
                  }),
              const SizedBox(
                height: 15,
              ),
              LawContainer(
                  text: 'q3'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 100,
                                )));
                  }),
              const SizedBox(
                height: 15,
              ),
              LawContainer(
                  text: 'q4'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 400,
                                )));
                  }),
              const SizedBox(
                height: 15,
              ),
              LawContainer(
                  text: 'q5'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 400,
                                )));
                  }),
              const SizedBox(
                height: 15,
              ),
              LawContainer(
                  text: 'q6'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 300,
                                )));
                  }),
              const SizedBox(
                height: 15,
              ),
              LawContainer(
                  text: 'q7'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 300,
                                )));
                  }),
              const SizedBox(
                height: 15,
              ),
              LawContainer(
                  text: 'q8'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 300,
                                )));
                  }),
              const SizedBox(
                height: 15,
              ),
              LawContainer(
                  text: 'q9'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentScreen(
                                  price: 300,
                                )));
                  }),
            ],
          ),
        ));
  }
}
