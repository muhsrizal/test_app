import 'dart:convert';

class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final String phone;
  final String ktp;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.ktp,
  });

  UserModel copyWith({
    int? id,
    String? fullName,
    String? email,
    String? password,
    String? phone,
    String? ktp,
  }) {
    return UserModel(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      ktp: ktp ?? this.ktp,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'ktp': ktp,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      fullName: map['fullname'],
      id: map['id'],
      ktp: map['ktp'],
      password: map['password'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
