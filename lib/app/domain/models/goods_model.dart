import 'dart:convert';

import 'package:bens/app/domain/models/user_model.dart';

class GoodsModel {
  final String? id;
  final UserModel user;
  final String name;
  final String description;
  final String? image;
  final String? qrcode;
  final String ownership;
  final String room;
  final num? volumeX;
  final num? volumeY;
  final num? volumeZ;
  final num? weight;
  final num? latitude;
  final num? longitude;
  GoodsModel({
    this.id,
    required this.user,
    required this.name,
    required this.description,
    this.image,
    this.qrcode,
    required this.ownership,
    required this.room,
    this.volumeX,
    this.volumeY,
    this.volumeZ,
    this.weight,
    this.latitude,
    this.longitude,
  });

  GoodsModel copyWith({
    String? id,
    UserModel? user,
    String? name,
    String? description,
    String? image,
    String? barcode,
    String? ownership,
    String? room,
    num? volumeX,
    num? volumeY,
    num? volumeZ,
    num? weight,
    num? latitude,
    num? longitude,
  }) {
    return GoodsModel(
      id: id ?? this.id,
      user: user ?? this.user,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      qrcode: barcode ?? qrcode,
      ownership: ownership ?? this.ownership,
      room: room ?? this.room,
      volumeX: volumeX ?? this.volumeX,
      volumeY: volumeY ?? this.volumeY,
      volumeZ: volumeZ ?? this.volumeZ,
      weight: weight ?? this.weight,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user.toMap(),
      'name': name,
      'description': description,
      'image': image,
      'barcode': qrcode,
      'ownership': ownership,
      'room': room,
      'volumeX': volumeX,
      'volumeY': volumeY,
      'volumeZ': volumeZ,
      'weight': weight,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory GoodsModel.fromMap(Map<String, dynamic> map) {
    return GoodsModel(
      id: map['id'],
      user: UserModel.fromMap(map['user']),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'],
      qrcode: map['barcode'],
      ownership: map['ownership'] ?? '',
      room: map['room'] ?? '',
      volumeX: map['volumeX'],
      volumeY: map['volumeY'],
      volumeZ: map['volumeZ'],
      weight: map['weight'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GoodsModel.fromJson(String source) =>
      GoodsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GoodsModel(id: $id, user: $user, name: $name, description: $description, image: $image, barcode: $qrcode, ownership: $ownership, room: $room, volumeX: $volumeX, volumeY: $volumeY, volumeZ: $volumeZ, weight: $weight, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GoodsModel &&
        other.id == id &&
        other.user == user &&
        other.name == name &&
        other.description == description &&
        other.image == image &&
        other.qrcode == qrcode &&
        other.ownership == ownership &&
        other.room == room &&
        other.volumeX == volumeX &&
        other.volumeY == volumeY &&
        other.volumeZ == volumeZ &&
        other.weight == weight &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        name.hashCode ^
        description.hashCode ^
        image.hashCode ^
        qrcode.hashCode ^
        ownership.hashCode ^
        room.hashCode ^
        volumeX.hashCode ^
        volumeY.hashCode ^
        volumeZ.hashCode ^
        weight.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
