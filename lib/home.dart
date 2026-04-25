import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homes extends StatelessWidget {
  const Homes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/Welcome.json"),
      ),
    );
  }
}