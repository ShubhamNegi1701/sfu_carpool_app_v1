// ignore: avoid_web_libraries_in_flutter

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sfucarpoolapp/Controller/auth.dart';
import 'package:sfucarpoolapp/Model/Users.dart';
import 'package:sfucarpoolapp/Controller/DataBaseHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:sqflite/sqflite.dart';


class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({this.toggleView}); //constructor call

  @override
  State<StatefulWidget> createState() => SignUpPage();
}

class SignUpPage extends State<SignUp> {

  final AuthService _auth = AuthService();
  String email = '';
  String firstName = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  //DataBaseHelper dataBaseHelper = DataBaseHelper();
 // List<Users> usersList;

  //final emailText = TextEditingController();
 // final passwordText = TextEditingController();
 // final usernameText = TextEditingController();
 // final passwordConfirm = TextEditingController();

  //Map<String, dynamic> userDataMap = Map<String, dynamic>();

  //setIsLogin() async {
  //  SharedPreferences prefs = await SharedPreferences.getInstance();
   // await prefs.setBool('isLoggedIn', true);
  //}

 // final dbHelper = DataBaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Sign up for '),
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Log In'),
              onPressed: () {
                widget.toggleView();
              }
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            child: SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('SFU',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Roboto',
                          color: Colors.white)),
                  Text('Carpool\n',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  TextField(
                   // controller: emailText,
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email Address',
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                //    controller: usernameText,
                    onChanged: (val){
                      setState(() {
                        firstName = val;
                      });
                    },
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'First Name',
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                   // controller: passwordText,
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                //    controller: passwordConfirm,
                    onChanged: (val){
                      setState(() {
                        confirmPassword = val;
                      });
                    },
                    obscureText: true,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Confirm Password',
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(15),
                    textColor: Colors.white,
                    onPressed: () async{
                      //_insert();
                      //setIsLogin();
                      print(email);
                      print(password);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null){
                          setState(() {
                            error = 'please supply valid input';
                          });
                      }
                    },
                  ),
                  //display error
                  SizedBox(height: 12),
                  Text(
                    error,
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }

  //Future<T> parseKeyFromFile<T extends RSAAsymmetricKey>(
  //    String filename) async {
  //  final file = File(filename);
   // final key = await file.readAsString();
 //   final parser = RSAKeyParser();
   // return parser.parse(key) as T;
 // }

  //void _insert() async {
  //  final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public.pem');
  //  final privKey = await parseKeyFromFile<RSAPrivateKey>('test/private.pem');
  //  final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privKey));
   // final encrypt_password = encrypter.encrypt(passwordText.text);

  //  final Map<String, dynamic> row = {
  //    DataBaseHelper.colUsername: usernameText.text,
  //    DataBaseHelper.colEmail: emailText.text,
  //    DataBaseHelper.colPassword: encrypt_password,
  //    DataBaseHelper.colReputation: 0,
   //   DataBaseHelper.col_driver_passenger: 1,
   // };
   // final id = dbHelper.insertUser(row);
  //  print('Inserted row id: $id');
  //}
}
