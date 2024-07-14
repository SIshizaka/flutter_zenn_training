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
      // Scaffold ウィジェット内の AppBar プロパティは、スクリーンの上部に表示されるアプリバーを指定するために使用されます。
      // 例えば `appBar: AppBar(title: const Text('Qiita Search'))` と設定しているため、
      // SearchScreen が描画された際、アプリバーの上端には 'Qiita Search'というタイトルが表示されます。
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
