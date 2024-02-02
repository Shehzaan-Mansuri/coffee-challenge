import 'package:coffee_challenge/utils/imports.dart';
import 'package:coffee_challenge/utils/routes/route_keys.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, homeRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: KColors.kPrimaryColor,
            radius: context.width * 0.2,
            child: Image.asset('assets/images/coffee-bean.png'),
          ).animate().fade().scale(duration: const Duration(milliseconds: 500)),
          const SizedBox(height: 15),
          Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: KColors.kPrimaryColor),
                  child: Text(
                    'Coffe App',
                    style: TextStyle(
                      fontSize: 20,
                      color: KColors.whiteF2F2F2,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  )).animate().slideX(
                begin: -1,
                end: 0,
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 800),
              )
        ],
      )),
    );
  }
}
