import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  int order_id;
  int uid;
  int driver_id;
  Timestamp date;
  String startAddress;
  String destination;
  double price;
  String feedback; // from user to driver
  int score_to_driver; // give score to driver 1-5
  int score_recieved; // for user's reputation 1-5

  History.fromMap(Map<String, dynamic> data){
    order_id = data['order_id'];
    uid = data['uid'];
    driver_id = data['driver_id'];
    date = data['date'];
    startAddress = data['startAddress'];
    destination = data['destination'];
    price = data['price'];
    feedback = data['feedback'];
    score_to_driver = data['score_to_driver'];
    score_recieved = data['score_recieved'];
  }

  Map<String, dynamic> toMap() {
    return {
      'order_id': order_id,
      'uid': uid,
      'driver_id': driver_id,
      'date': date,
      'startAddress': startAddress,
      'destination': destination,
      'price': destination,
      'feedback': feedback,
      'score_to_driver': score_to_driver,
      'score_recieved': score_recieved,
    };
  }
}