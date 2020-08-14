import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:sfucarpoolapp/Controller/auth.dart';
import 'package:sfucarpoolapp/View/home.dart';
import 'package:sfucarpoolapp/Model/user.dart';
import 'package:sfucarpoolapp/Controller/wrapper.dart';
import 'View/login.dart';
import 'View/signup.dart';

void main() => runApp(new CarPoolApp());

class CarPoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'SFU CarPool App',
        home: Wrapper(),
        theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.red[900]),
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
          Text(
            'Carpool\n',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 60,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ButtonTheme(
            minWidth: 200,
            height: 40,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogIn()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: const Text('   SIGN UP    ',
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainMapPage()));
              },
              child: const Text('   MAP PAGE   ',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: Colors.red[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ],
      ),
    );
  }
}

