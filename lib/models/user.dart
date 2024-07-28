import 'package:flutter/material.dart';

// ユーザーを表すクラス
class User {
  // コンストラクタ
  User({
    required this.id,
    required this.profileImageUrl,
  });

  // プロパティ
  final String id;
  final String profileImageUrl;

  // JSONからUserを生成するファクトリコンストラクタ
  // Dartのクラスにおいて特別なコンストラクターを宣言するために使用されます。特別なこのコンストラクターは、自分自身のインスタンスや他のクラスのインスタンスを返すことができます。
  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'] as String,
      profileImageUrl: json['profile_image_url'] as String,
    );
  }
}
