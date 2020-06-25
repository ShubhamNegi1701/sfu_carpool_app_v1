import 'dart:html';

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor:Theme.of(context).primaryColor,
        body: Center(
            child:Column(
              children: <Widget>[
                Text('SignUp Page\n\n',
                    style: TextStyle(
                        fontSize: 60
                    )),
                RaisedButton(
                    onPressed: (){

                    },
                    child: const Text('Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:60
                        ))
                )
              ],
            )
        )
    );
  }
}