import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, '/main');
    });

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/triceratops.png',
            width: 180,
            height: 180,
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Text(
              "Triceratops",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )
        ],
      )),
    );
  }
}
//작가 brgfx</a> 출처 Freepik
