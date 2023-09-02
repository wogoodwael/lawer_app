import 'package:flutter/material.dart';
import 'package:law_app/core/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, 'Info'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("images/splash.png"),
                  fit: BoxFit.cover,
                )),
              ),
            ],
          ),
          Text(
            "المرشد القانوني ",
            style: TextStyle(color: ColorApp.text_color, fontSize: 30),
          )
        ],
      ),
    );
  }
}
