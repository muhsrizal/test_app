import 'dart:convert';

import 'user_model.dart';

class LaporanBerandaModel {
  final int? id;
  final int? userId;
  final String? title;
  final String? desc;
  final String? image;
  final int? status;
  final String? latitude;
  final String? longitude;
  final int? like;
  final int? dislike;
  final DateTime updatedAt;
  final DateTime createdAt;
  final UserModel? userModel;

  LaporanBerandaModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.desc,
    required this.image,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.like,
    required this.dislike,
    required this.updatedAt,
    required this.createdAt,
    required this.userModel,
  });

  LaporanBerandaModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? desc,
    String? image,
    int? status,
    String? latitude,
    String? longitude,
    int? like,
    int? dislike,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserModel? userModel,
  }) {
    return LaporanBerandaModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      status: status ?? this.status,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userModel: userModel ?? this.userModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "user_id": userId,
      "title": title,
      "desc": desc,
      "image": image,
      "status": status,
      "latitude": latitude,
      "longitude": longitude,
      "like": like,
      "dislike": dislike,
      "created_at": createdAt.toString(),
      "updated_at": updatedAt.toString(),
      "user_model": userModel?.toMap(),
    };
  }

  factory LaporanBerandaModel.fromMap(Map<String, dynamic> map) {
    return LaporanBerandaModel(
      id: map['id'],
      userId: map['user_id'],
      title: map['title'].toString(),
      desc: map['desc'].toString(),
      image: map['image'].toString(),
      status: map['status'],
      latitude: map['latitude'].toString(),
      longitude: map['longitude'].toString(),
      like: map['like'],
      dislike: map['dislike'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      userModel: UserModel.fromMap(map),
    );
  }

  String toJson() => json.encode(toMap());

  factory LaporanBerandaModel.fromJson(String source) =>
      LaporanBerandaModel.fromMap(json.decode(source));
}
