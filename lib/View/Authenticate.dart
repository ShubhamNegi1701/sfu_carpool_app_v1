import 'package:flutter/material.dart';
import 'package:sfucarpoolapp/View/login.dart';
import 'package:sfucarpoolapp/View/signup.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //flip between login and sign up screens
  bool showLogIn = true;
  void toggleView() {
    setState(() {
      showLogIn = !showLogIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLogIn){
      return LogIn(toggleView: toggleView);
    }   else {
        return SignUp(toggleView: toggleView);
      }
    }
  }

