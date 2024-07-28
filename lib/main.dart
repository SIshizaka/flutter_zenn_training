import 'package:flutter/material.dart';
import 'package:flutter_zenn_training/screens/search_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
Widget build(BuildContext context) {
    // 画面のタイトルを設定
    return MaterialApp(
      title: 'Qiita Search', // 画面のタイトルの文字列
      theme: ThemeData(
        primarySwatch: Colors.green, // 主要な色を緑に設定
        fontFamily: 'Hiraigino Sans', // フォント名を「Hiragino Sans」に設定
        appBarTheme: const AppBarTheme(
          // アプリケーションバーのスタイル
          backgroundColor: Color(0xFF55C500), // アプリケーションバーの背景色を緑に設定
      ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white, // テキストの文字色を白に設定
            ),
      ),
      home: const SearchScreen(), // ホーム画面として検索画面を指定
    );
  }
}
