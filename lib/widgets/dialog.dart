import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogP {
  Future<void> dialogBuilderimg(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('10'.tr),
          content: Text('20'.tr),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('14'.tr),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('16'.tr),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 100,
                      left: 10,
                      right: 10,
                    ),
                  ),
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('13'.tr),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('21'.tr),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 100,
                      left: 10,
                      right: 10,
                    ),
                  ),
                );
                Navigator.pushReplacementNamed(context, 'Info');
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> dialogBuilderinfo(
      BuildContext context, String name, String? phone) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('10'.tr),
          content: Text('${'11'.tr}  ${name} \n ${'12'.tr}  ${phone}'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('14'.tr),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('16'.tr),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 100,
                      left: 10,
                      right: 10,
                    ),
                  ),
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('13'.tr),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('15'.tr),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 100,
                      left: 10,
                      right: 10,
                    ),
                  ),
                );
                Navigator.pushReplacementNamed(context, 'Lawer');
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> dialogBuilderlawer(
      BuildContext context, String name, String? phone) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('المحامي '.tr),
          content: Text('اسم المحامي ${name} , \n رقم الهاتف ${phone}'),
        );
      },
    );
  }

  Future<void> dialogBuilderlawers(
      BuildContext context, List<String> name, List<String> phone) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('المحامي '.tr),
          content: Container(
            width: 20,
            height: 200,
            child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                        'اسم المحامي ${name[index]}  \n رقم الهاتف ${phone[index]}'),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
