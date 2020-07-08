class Users {
  final int id;
  final String username;
  final String email;
  final String password;
  final int reputation;
  final int driver_passenger; // driver : 0, passenger: 1

  Users(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.reputation,
      this.driver_passenger});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'reputation': reputation,
      'driver_passenger': driver_passenger,
    };
  }
}
