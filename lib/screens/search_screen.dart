// lib/screens/search_screen.dart (1-21)
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  // SearchScreenクラスのコンストラクター。この中でSearchScreenインスタンスを作成する。
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// _SearchScreenStateはSearchScreenのStateを表します。
class _SearchScreenState extends State<SearchScreen> {
  // StatelessWidgetではStatelessWidgetですが、StatefulWidgetであるためstateを持つ必要があります。
  @override
  Widget build(BuildContext context) {
    // ScaffoldはMaterial Designの基本的なレイアウトコンポーネントです。
    // これを使用することで、アプリケーションの基本的なレイアウトを設定できます。
    return Scaffold(
      // appBarプロパティには、Scaffoldの上部に表示されるタイトルやボタンなどを管理するためのコンポーネントを指定します。
      appBar: AppBar(title: const Text('Qiita Search')
          // これは、SearchScreenのタイトルとしてQiita Searchという文字列を設定しています。
          ),
      // bodyプロパティには、Scaffoldの主体部分のWidgetを指定します。
      // これは、SearchScreenの主要な内容を表すWidgetです。
      body: Container(),
      // これは空のContainerです。実際に使うには、以下のように書き換える必要があります。
      // 例えば、TextやListViewなどのWidgetを指定することができます。
    );
  }
}
