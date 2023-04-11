class UserModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }
}
