import 'package:flutter/material.dart';
// json変換で使用
import 'dart:convert';
// http通信で使用 httpという変数を通して、httpパッケージにアクセス
import 'package:http/http.dart' as http;
// 秘匿化したアクセストークンの取得に使用
import 'package:flutter_dotenv/flutter_dotenv.dart';
// 作成済みのArticleクラス
import 'package:flutter_zenn_training/models/article.dart';

class SearchScreen extends StatefulWidget {
  // SearchScreenクラスのコンストラクター。この中でSearchScreenインスタンスを作成する。
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// _SearchScreenStateはSearchScreenのStateを表します。
class _SearchScreenState extends State<SearchScreen> {
  // StatelessWidgetではStatelessWidgetですが、StatefulWidgetであるためstateを持つ必要があります。
  // 検索結果を格納する変数
  List<Article> articles = [];
  @override
  Widget build(BuildContext context) {
    // ScaffoldはMaterial Designの基本的なレイアウトコンポーネントです。
    // これを使用することで、アプリケーションの基本的なレイアウトを設定できます。
    return Scaffold(
      // Scaffold ウィジェット内の AppBar プロパティは、スクリーンの上部に表示されるアプリバーを指定するために使用されます。
      // 例えば `appBar: AppBar(title: const Text('Qiita Search'))` と設定しているため、
      // SearchScreen が描画された際、アプリバーの上端には 'Qiita Search'というタイトルが表示されます。
      appBar: AppBar(title: const Text('Qiita Search')
          ),
      body: Column(
        children: [
          //検索ボックス
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 36,
            ),
            child: TextField(
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              // プレースホルダー
              decoration: InputDecoration(hintText: '検索ワードを入力してください'),
              // Enter押下時に画面から入力を受け取る
              onSubmitted: (String value) async {
                // 検索処理を実行する
                final results = await searchQiita(value);
                // 検索結果を代入
                setState(() => articles = results);
              },
            ),
          )
          //検索結果一覧
        ],
      ),

    );
  }
  Future<List<Article>> searchQiita(String keyword) async {
    // 1.http通信に必要なデータを準備する
    final uri = Uri.https('qiita.com', '/api/v2/items', {
      'query': 'title:$keyword',
      'per_page': '10',
    });
    // アクセストークンの取得
    final String token = dotenv.env['QIITA_ACCESS_TOKEN'] ?? '';
    // 2.QiitaAPIにリクエストを送る
    final http.Response res = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
    });
    // 3.戻り値をArticleクラスの配列に変換
    // 4.変換したArticleクラスの配列を返す
    if (res.statusCode == 200) {
      //レスポンスをモデルクラスへ変換
      final List<dynamic> body = jsonDecode(res.body);
      return body.map((dynamic json) => Article.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
