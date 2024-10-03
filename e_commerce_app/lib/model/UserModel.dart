// ignore_for_file: constant_identifier_names, non_constant_identifier_names, file_names

enum Role {
  USER,
  ADMIN,
}

class User {
  String id;
  String first_name;
  String last_name;
  String username;
  String password;
  Role role;

  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.username,
    required this.password,
    required this.role,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      username: json['username'],
      password: json['password'],
      role: Role.values.firstWhere((role) => role.toString() == json['role']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'password': password,
      'role': role.toString().split('.').last, // Convert enum to string
    };
  }
}
