class User {
  final String uid;
  final String firstname;
  final String email;
  final String password;
  final int reputation;
  final bool driver; // driver : true, passenger: false

  User(
      {this.uid,
      this.firstname,
      this.email,
      this.password,
      this.reputation,
      this.driver});
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
