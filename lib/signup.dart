import 'package:flutter/material.dart';
import 'package:registration_app/login.dart';
import 'package:registration_app/service.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  bool isvisible = true;
  bool visible = true;
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
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Sign up",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                SizedBox(height: 10),
                Text(
                  "Create an account,It's free",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Username",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),
                TextFormField(
                  controller: usernamecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'username is required';
                    }
                    if (value.length < 3) {
                      return 'Username must be at least 3 characters';
                    }
                    if (value.length > 20) {
                      return 'Username must not exceed 20 characters';
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains("@")) {
                      return 'enter a valid email';
                    }
                    return null;
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'passowrd is required';
                    }
                    if (value.length < 6) {
                      return 'password must be atleast 6 characters';
                    }
                    return null;
                  },

                  obscureText: isvisible,
                  controller: passwordcontroller,

                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      icon: isvisible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please confirm your password';
                    }
                    if (value != passwordcontroller.text) {
                      return 'passwords do not match';
                    }
                    return null;
                  },
                  obscureText: visible,

                  controller: confirmpasswordcontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      icon: visible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 55,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        signup(
                          usernamecontroller.text,
                          emailcontroller.text,
                          passwordcontroller.text,
                          confirmpasswordcontroller.text,
                          context,
                        );
                      }
                    },
                    child: Text("Sign up"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
