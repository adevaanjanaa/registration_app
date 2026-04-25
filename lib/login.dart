import 'package:flutter/material.dart';
import 'package:registration_app/forgot.dart';
import 'package:registration_app/service.dart';
import 'package:registration_app/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isvisible = true;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  const Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Login to your account",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),

                  const SizedBox(height: 10),

                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),

                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains("@")) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),

                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: isvisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isvisible = !isvisible;
                          });
                        },
                        icon: Icon(
                          isvisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 5),

                  // FIXED FORGOT PASSWORD
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Forgot(),
                        ),
                      );
                    },
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 41, 106, 180),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    height: 55,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          login(
                            emailcontroller.text,
                            passwordcontroller.text,
                            context,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Image.network(
                    "https://static.vecteezy.com/system/resources/thumbnails/016/900/444/small/online-dating-app-login-illustration-valentine-s-day-love-match-mobile-leaves-gradient-character-illustration-vector.jpg",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}