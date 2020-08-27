import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sfucarpoolapp/Controller/auth.dart';
import 'package:sfucarpoolapp/Controller/validator.dart';

class ForgetPwd extends StatefulWidget{
  /* TODO: The navigation toggle to login page is not working since we need corresponding changes in Authenticate.dart
      it be nice if Shubham can help me do the certain modification on the code. I don't wanna mess up your logic, Thank you!! -- Christina */
  final Function toggleView;
  ForgetPwd({this.toggleView});

  @override
  State<StatefulWidget> createState(){
    return _ForgetPwd();
  }
}

class _ForgetPwd extends State<ForgetPwd>{
  final AuthService _auth = AuthService();
  static String userEmail;
  static String warning;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Log in'),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      showAlert(),
                      SizedBox(height: 20),
                      Text('Reset Password\n',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Roboto',
                              color: Colors.white)
                      ),
                      TextFormField(
                        validator: Validator.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val){
                          setState(() {
                            userEmail = val;
                          });
                        },
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Your Email Address',
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
                          'Submit',
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
                          try {
                            _auth.sendPwdResetEmail(userEmail);
                            print("Password reset email sent");
                            setState(() {
                              warning = "A password reset link has been sent to $userEmail";
                            });
                          } catch (e){
                            print(e);
                            setState(() {
                              warning = e.message;
                            });
                          }
                        },
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

  Widget showAlert() {
    if (warning != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: Text(
                warning,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    warning = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    else {
      return SizedBox(
        height: 0,
      );
    }
  }
}