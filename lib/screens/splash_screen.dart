import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      setState(() {});
      Navigator.pushReplacementNamed(context, '/auth');
    });
  }

  List<Widget> _showLogo() {
    // Size size = MediaQuery.of(context).size;

    return [
      const SizedBox(
        height: 50,
      ),
      Container(
        padding: const EdgeInsets.all(5),
        // height: size.height / 2,
        // width: size.width * 0.90,
        child: Image.asset(
          'assets/icons/1.gif',
          fit: BoxFit.cover,
          height: 250,
        ),
      ),
      const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.teal,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: _showLogo()),
      ),
    );
  }
}
