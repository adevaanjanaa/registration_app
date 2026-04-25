import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration_app/home.dart';

Future<void> signup(
  String uname,
  String email,
  String password,
  String confirmpassword,
  BuildContext context,
) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Signup Successful")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> login(String Email, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email, password: password);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('login Successfully')));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homes()));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> forgot(String Email, BuildContext context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: Email);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("password reset email sent")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
