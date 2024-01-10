class User {
  int? id;
  String username;
  String password;
  String email;
  String phone;
  String address;

  User(this.id, this.username, this.password, this.email, this.phone, this.address);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'address': address
    };

    return map;
  }
}
