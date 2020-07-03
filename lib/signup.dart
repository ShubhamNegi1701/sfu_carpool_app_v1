// ignore: avoid_web_libraries_in_flutter


import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
        elevation: 0,
      ),
      backgroundColor:Theme.of(context).primaryColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return  Container(
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
                              fontSize: 40, fontFamily: 'Roboto', color: Colors.white)),
                      Text('Carpool\n',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      TextField(
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
                      SizedBox(height: 20,),
                      TextField(
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
                      SizedBox(height: 20,),
                      TextField(
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
                      SizedBox(height:20,),
                      TextField(
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
                      SizedBox(height:20,),
                      FlatButton(
                        child: Text('Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2 ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(15) ,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )

            ),
          );
        },
      ),
    );
  }
}