import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryScreen extends StatefulWidget{
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>{
  var _auth = FirebaseAuth.instance;
  var _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  String loggedInId = "";
  List<dynamic> orderList = List<dynamic>();

  @override
  void initState(){
    super.initState();
    getCurrentUser();
    getHistoryOrders();
  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
      if (user != null) {
        print(user.uid);
        loggedInUser = user;
        loggedInId = user.uid;
      }
      else{
        print("Error finding user.");
      }
    }
    catch(e){
      print(e);
    }
  }

  void getHistoryOrders() async{
    await for(var snapshot in _firestore.collection('history').snapshots()) {
      for (var order in snapshot.documents) {
        if (order.data['uid'] == loggedInId) {
          orderList.add(order.data);
        }
      }
    }
    print(orderList);
  }

  // TODO: need more UI design
  @override
  Widget build(BuildContext context) {
    var length = 0;
    if(orderList == null){
      length = 0;
    }else{
      length = orderList.length;
    }
    print(length);

    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: length,
            shrinkWrap: true,
            itemBuilder: (BuildContext ctxt, int index){
              return Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.redAccent[300],
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text("Route:"),
                      title: Text("${orderList[index]['startAdd']} --> ${orderList[index]['destination']}"),
                    ),
                    ListTile(
                      leading: Text("Driver:"),
                      title: Text("${orderList[index]['driver_id']}"),
                    ),
                    ListTile(
                      leading: Text("Date: "),
                      title: Text("${orderList[index]['date'].toDate()}"),
                    )
                  ]
                )
              );
            }
          ),
      ),
    );
  }
}