import 'package:flutter/material.dart';
import 'package:registration_app/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.only(left: 50, right: 50),
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "Login",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              SizedBox(height: 10),
              Text(
                "Login to your account",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              SizedBox(height: 10),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
              TextField(
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
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 55,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Login"),
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
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text(
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
              Image.network(
                "https://static.vecteezy.com/system/resources/thumbnails/016/900/444/small/online-dating-app-login-illustration-valentine-s-day-love-match-mobile-leaves-gradient-character-illustration-vector.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}



