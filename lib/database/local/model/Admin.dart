class Admin {
  int? id;
  String? username;
  String? password;
  String? name;
  String? position;
  String? mobileno;
  int? status;
  Admin(
      {this.id,
      this.username,
      this.password,
      this.name,
      this.position,
      this.mobileno,
      this.status});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'name': name,
      'position': position,
      'mobileno': mobileno,
      'status': status
    };
  }

  static Admin fromJson(Map<String, Object> first) => Admin(
      username: first['username'] as String,
      password: first['password'] as String,
      name: first['name'] as String,
      position: first['position'] as String,
      mobileno: first['mobileno'] as String,
      status: first['status'] as int);
}
