

import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';

void main() => runApp(new CarPoolApp());

class CarPoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SFU CarPool App',
      home: HomePage(),
      theme: ThemeData(
          primaryColor:Colors.red,
          accentColor: Colors.red[900]
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SizedBox(
          width: 400,
          child: HomeButtons(),
        ),
      ),
    );
  }
}

class HomeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('SFU',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 60, fontFamily: 'Roboto', color: Colors.white)),
        Text('Carpool\n',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 60,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        ButtonTheme(
          minWidth: 200,
          height: 40,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogInPage()));
            },
            child: const Text('   LOG IN   ',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            color: Colors.red[900],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
        ButtonTheme(
            minWidth: 200,
            height: 40,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: const Text('   SIGN UP    ',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: Colors.red[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ))
      ],
    ));
  }
}


