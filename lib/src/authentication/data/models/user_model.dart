import 'dart:convert';

import 'package:tdd_bloc_design_pattern/core/utils/typedef.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel.empty() : this(id: 1, createdAt: '_empty.createdAt', name: '_empty.name', avatar: '_empty.avatar');

  const UserModel({
    required int id,
    required String createdAt,
    required String name,
    required String avatar,
  }) : super(id: 0, createdAt: '', name: '', avatar: '');

  UserModel copyWith({
    int? id,
    String? createdAt,
    String? name,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }


  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
          avatar: map['avatar'] as String,
        );

  DataMap toMap() => {
        'id': id,
        'createdAt': createdAt,
        'name': name,
        'avatar': avatar,
      };

  String toJson() => json.encode(toMap());
}
