import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:registration_app/Welcomepage.dart';
import 'package:registration_app/firebase_options.dart';

import 'package:registration_app/forgot.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
     
      home: Welcomepage(),
    );
  }
}

