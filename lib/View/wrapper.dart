import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfucarpoolapp/View/Authenticate.dart';
import 'package:sfucarpoolapp/View/home.dart';
import 'package:sfucarpoolapp/View/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final user = Provider.of<User>(context);



    //return either Home or Authenticate (Login, Signup)
    if(user == null) {
      return Authenticate();
    } else {
      return MainMapPage();
    }
    //remember: MainMapPage is the name of home widget
  }
}
