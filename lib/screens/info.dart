// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law_app/core/constants/colors.dart';
import 'package:law_app/core/localization/changelocal.dart';
import 'package:law_app/widgets/buttons.dart';
import 'package:law_app/widgets/dialog.dart';
import 'package:law_app/widgets/gender.dart';
import 'package:law_app/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen();

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  LocalController controller = LocalController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DialogP dialogP = DialogP();
  GlobalKey<FormState> _globalKey = GlobalKey();
  bool valid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 1 * MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/first.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            Positioned(
                top: .1 * MediaQuery.of(context).size.height,
                right: .03 * MediaQuery.of(context).size.width,
                child: IconButton(
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(100, 100, 10, 100),
                        items: [
                          PopupMenuItem(
                            onTap: () {
                              controller.changelan("ar_EG");
                            },
                            value: 1,
                            child: Text("عربي"),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              controller.changelan("en");
                            },
                            value: 1,
                            child: Text("English"),
                          ),
                        ],
                      );
                    },
                    icon: Icon(
                      Icons.language,
                      color: Colors.greenAccent,
                    ))),
            Positioned(
                top: .15 * MediaQuery.of(context).size.height,
                right: .03 * MediaQuery.of(context).size.width,
                child: IconButton(
                  icon: Icon(
                    Icons.menu_book_rounded,
                    color: Colors.greenAccent,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'details');
                  },
                )),
            Positioned(
              top: .35 * MediaQuery.of(context).size.height,
              left: .05 * MediaQuery.of(context).size.width,
              right: .05 * MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      Container(
                        width: .90 * MediaQuery.of(context).size.width,
                        height: .60 * MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 71, 93, 114)
                                    .withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            // border: Border.all(color: Color.fromARGB(255, 71, 93, 114)),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: .06 * MediaQuery.of(context).size.height,
                            ),
                            Text(
                              "1".tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            CustomTextField(
                              text: '2'.tr,
                              hint_text: '3'.tr,
                              icon: Icons.person,
                              controller: nameController,
                              // sufixIcon: check(nameController.text)?Icon(Icons.check):Icon(Icons.error)
                            ),
                            CustomTextField(
                              hint_text: '4'.tr,
                              icon: Icons.phone_android,
                              text: '5'.tr,
                              controller: phoneController,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: .05 *
                                          MediaQuery.of(context).size.width,
                                      top: .03 *
                                          MediaQuery.of(context).size.height),
                                  child: Text(
                                    "6".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.text_color),
                                  ),
                                ),
                              ],
                            ),
                            Gender(),
                            CustomButtons(
                                color: ColorApp.primary,
                                text_color: Colors.white,
                                text: '9'.tr,
                                onpress: () async {
                                  if (_globalKey.currentState!.validate()) {
                                    SharedPreferences sharedPreferences =
                                        await SharedPreferences.getInstance();
                                    await sharedPreferences.setString(
                                        'info',
                                        jsonEncode({
                                          "name": "${nameController.text}",
                                          "phone": "${phoneController.text}",
                                        }));
                                    print(nameController.text);
                                    if (nameController.text == "" ||
                                        phoneController.text == "") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height -
                                                    100,
                                                left: 10,
                                                right: 10,
                                              ),
                                              content: Text(
                                                '28'.tr,
                                              )));
                                    } else {
                                      dialogP.dialogBuilderinfo(
                                          context,
                                          nameController.text,
                                          phoneController.text);
                                    }
                                  }
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
