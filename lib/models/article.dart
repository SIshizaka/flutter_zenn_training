import 'package:flutter_zenn_training/models/user.dart';

// 記事自体を表すモデル
class Article {
  // コンストラクタ
  Article({
    required this.title,
    required this.user,
    this.likesCount = 0,
    this.tags = const [],
    required this.createdAt,
    required this.url,
  });

  // プロパティ
  final String title;
  final User user;
  final int likesCount;
  final List<String> tags;
  final DateTime createdAt;
  final String url;

  // JSONからArticleを生成するファクトリコンストラクタ
  factory Article.fromJson(dynamic json) {
    return Article(
      title: json['title'] as String,
      // User.fromJson()を使ってUserを生成
      user: User.fromJson(json['user']),
      url: json['url'] as String,
      // DateTime.parse()を使って文字列をDateTimeに変換
      createdAt: DateTime.parse(json['createdAt'] as String),
      likesCount: json['likesCount'] as int,
      // List<String>.from()を使ってList<String>に変換
      // jsonを受け取り、１つ１つ展開と変換を行っています。tagsは名前だけ欲しいのでmapで展開し、名前だけの配列に変換しています。
      tags: List<String>.from(json['tags'].map((tag) => tag['name'])),
    );
  }
}
