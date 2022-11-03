import 'package:flutter/material.dart';
import 'package:radio_sample/custom_radio.dart';
import 'package:radio_sample/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio_Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Radio_Sample_Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///　選択中ラジオボタン、Enumの形で保持しておく
  GenderEnum selectedGender = GenderEnum.noSelect;

  /// ラジオボタン選択変更時
  /// CustomRadioウィジェット.選択変更時イベントに対するコールバック関数
  void selectedChanged(GenderEnum selectedGender) {
    // ラジオボタンの選択値をこのページの変数にセットするだけ
    this.selectedGender = selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomRadio(
              firstSelectRadio: GenderEnum.man, // 初期選択
              selectedChanged: selectedChanged, // ラジオボタンの選択変更時に実行されるメソッド
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 300,
                height: 35,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 2,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // とりあえず選んだ情報を表示してみる
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Scaffold(
                              body: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ↓ Enumの基本的な使い方がわかると思います！
                                  Text('selectedGender　    ： $selectedGender'),
                                  Text('選択中の性別名　 　： ${selectedGender.name}'),
                                  Text('選択中の性別コード ： ${selectedGender.code}')
                                  // ↑ Enumの基本的な使い方がわかると思います！
                                ],
                              ),
                            ));

                    // 次のページに行く時に今のページの状態をストアに保持する
                    Store.instance.gender = selectedGender;
                  },
                  child: const Text('次へ'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
