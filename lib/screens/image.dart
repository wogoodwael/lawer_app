// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_widget/image_picker_widget.dart';
import 'package:law_app/core/constants/colors.dart';
import 'package:law_app/core/constants/connection_links.dart';
import 'package:law_app/core/services/api.dart';

import 'package:law_app/widgets/dialog.dart';
import 'package:law_app/widgets/gender.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImageScreen extends StatefulWidget {
  ImageScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  DialogP? dialogP = DialogP();
  TextEditingController textEditingController = TextEditingController();
  Links links = Links();
  Api api = Api();

  File? choosen_file;
  Gender gender = Gender();

  bool _isLoading = false;

  Future<bool> uploadFile() async {
    try {
      var postUri = Uri.parse("https://lawyer.bilsjekk.in/api/consultations");
      var request = http.MultipartRequest("POST", postUri);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String json = sharedPreferences.getString("info")!;
      Map data = jsonDecode(json);
      request.fields['name'] = data['name'];
      request.fields['phone'] = data['phone'];
      request.fields['subject'] = textEditingController.text;
      request.fields['gender'] = "no gender";
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        choosen_file!.path,
      ));

      return await request.send().then((response) async {
        if (response.statusCode == 200) {
          print("Uploaded!");
          return true;
        } else {
          print("error-----${await response.stream.bytesToString()}");
          return false;
        }
      });
    } on Exception catch (e) {
      print("error ${e}");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('27'.tr),
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorApp.text_color,
        ),
        body: _isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: ColorApp.primary,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('30'.tr)
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      '29'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorApp.text_color),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: ImagePickerWidget(
                            editIcon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 25,
                            ),
                            backgroundColor: Colors.white,
                            diameter: 200,
                            fit: BoxFit.cover,
                            initialImage: AssetImage("images/lawer.jpg"),
                            shape: ImagePickerWidgetShape.square,
                            isEditable: true,
                            shouldCrop: true,
                            imagePickerOptions:
                                ImagePickerOptions(imageQuality: 65),
                            onChange: (file) {
                              print("I changed the file to: ${file.path}");
                              setState(() {
                                choosen_file = File(file.path);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 71, 93, 114)
                                  .withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: ColorApp.primary),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (val) {},
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  textEditingController.clear();
                                },
                              ),
                              border: InputBorder.none,
                              hintText: '24'.tr,
                              hintStyle: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      elevation: 10,
                      minWidth: 200,
                      color: ColorApp.text_color,
                      shape: const StadiumBorder(),
                      onPressed: () async {
                        if (choosen_file == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('29'.tr),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 100,
                                left: 10,
                                right: 10,
                              ),
                            ),
                          );
                        } else {
                          setState(() {
                            _isLoading = true;
                          });
                          await uploadFile();

                          setState(() {
                            _isLoading = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('21'.tr),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 100,
                                left: 10,
                                right: 10,
                              ),
                            ),
                          );
                          Navigator.pushReplacementNamed(context, 'Info');
                        }

                        // dialogP!.dialogBuilderimg(context);
                      },
                      child: Text(
                        '25'.tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ));
  }
}
