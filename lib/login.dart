//import 'dart:html';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor:Theme.of(context).primaryColor,
        body: Center(
            child:Text('Login Page')
        )
    );
}
}