class User {
  final String uid;
  final String firstname;
  final String email;
  final String password;
  final int reputation;
  final int driver_passenger; // driver : 0, passenger: 1

  User(
      {this.uid,
        this.firstname,
        this.email,
        this.password,
        this.reputation,
        this.driver_passenger});
}


//
//  Users(
//      {this.id,
//        this.username,
//        this.email,
//        this.password,
//        this.reputation,
//        this.driver_passenger});
//
//  Map<String, dynamic> toMap() {
//    return {
//      'id': id,
//      'username': username,
//      'email': email,
//      'password': password,
//      'reputation': reputation,
//      'driver_passenger': driver_passenger,
//    };
//  }
//}
