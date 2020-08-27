// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:sfucarpoolapp/Controller/auth.dart';
import 'package:sfucarpoolapp/Controller/validator.dart';

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
                  TextFormField(
                   // controller: emailText,
                    validator: Validator.validateEmail,
                    keyboardType: TextInputType.emailAddress,
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
                  TextFormField(
                    validator: Validator.validateName,
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
                  TextFormField(
                    validator: Validator.validatePassword,
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
                      print(email);
                      print(password);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null){
                          setState(() {
                            error = 'please supply valid input';
                          });
                      }
                      else{ // alert dialogue
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text("Reminder"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                            'Please Check your Email Inbox to Activate your Account.'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ]
                              );
                            }
                        );
                      }
                    },
                  ),

                  SizedBox(height: 8),
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
}
