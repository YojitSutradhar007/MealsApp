import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigation();
  }

  void navigation() {
    Duration duration = const Duration(seconds: 2);
    Future.delayed(
      duration,
      () {
        //TODO: Add navigation
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child:Text("Meals App") //main Content,
          ),
        ),
      ),
    );
  }
}
