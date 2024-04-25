class User {
  //ตัวแปรเก็บข้อมูลที่สอดรับกับตารางใน DB
  int? id;
  String? fullname;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? picture;

  User({
    this.id,
    this.fullname,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.picture,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullname: json['fullname'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'picture': picture,
    };
  }
}
