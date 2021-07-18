import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome to App :)",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(" Pressing");
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 36.0)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
