import 'package:flutter/material.dart';

/// 性別列挙体
/// 使い方
/// ① ただただ何かしらの判別に使う方法    -> GenderEnum.man
/// ② Enumが示す値を取得する方法        -> GenderEnum.man.name
/// ③ Enumが示す値のコードを取得する方法  -> GenderEnum.man.code
enum GenderEnum {
  man('男性', '0'),
  woman('女性', '1'),
  noSelect('未選択', '2');

  const GenderEnum(this.name, this.code);
  final String name;
  final String code;

  // もし他にEnumに追加したいフィールがあればこんな感じで自由に増やしていけます！
  // ↓ code2フィールドを増やす例
  // man('男性', '0', 'hogehoge'),
  // woman('女性', '1', 'fugafuga'),
  // noSelect('未選択', '2', 'piyopiyo');

  // const GenderEnum(this.name, this.code, this.code2);
  // final String name;
  // final String code;
  // final String code2;
}

/// ボタンデザインの自作ラジオボタンウィジェット
/// パラメタ１：ラジオボタン初期選択<GenderEnum>
/// パラメタ２：ラジオボタン選択変更時処理<Function(GenderEnum selectedGender)>
class CustomRadio extends StatefulWidget {
  const CustomRadio(
      {super.key,
      required this.firstSelectRadio,
      required this.selectionChanged});

  /// ラジオボタン選択の初期値
  final GenderEnum firstSelectRadio;

  /// ラジオボタン選択変更時
  final Function(GenderEnum selectedGender) selectionChanged;

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  /// 初期化処理
  @override
  void initState() {
    super.initState();

    // 初期選択ラジオボタンパラメタによって選択値を決定
    if (widget.firstSelectRadio == GenderEnum.man) {
      // 男性
      _selectManRadio();
    } else if (widget.firstSelectRadio == GenderEnum.woman) {
      // 女性
      _selectWoManRadio();
    } else {
      // 未選択
      _selectNoSelectRadio();
    }
  }

  /// 男性ラジオボタン_背景色
  Color? manBackColor = Colors.transparent;

  /// 男性ラジオボタン_正面
  Color? manForeColor = Colors.black;

  /// 男性ラジオボタン_チェックアイコン表示/非表示
  /// true:アイコン表示、false：アイコン非表示
  bool isManIconVisible = false;

  /// 女性ラジオボタン_背景色
  Color? womanBackColor = Colors.transparent;

  /// 女性ラジオボタン_正面
  Color? womanForeColor = Colors.black;

  /// 女性ラジオボタン_チェックアイコン表示/非表示
  /// true:アイコン表示、false：アイコン非表示
  bool isWoManIconVisible = false;

  /// 未選択ラジオボタン_背景色
  Color? noSelectBackColor = Colors.transparent;

  /// 未選択ラジオボタン_正面
  Color? noSelectForeColor = Colors.black;

  /// 未選択ラジオボタン_チェックアイコン表示/非表示
  /// true:アイコン表示、false：アイコン非表示
  bool isNoSelectIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 男性ボタン
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                elevation: 2,
                foregroundColor: manForeColor,
                backgroundColor: manBackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _selectManRadio,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isManIconVisible ? const Icon(Icons.check) : Container(),
                  const Text('男性',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ),

        // 女性ボタン
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                elevation: 2,
                foregroundColor: womanForeColor,
                backgroundColor: womanBackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _selectWoManRadio,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isWoManIconVisible ? const Icon(Icons.check) : Container(),
                  const Text('女性',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),

        // 未選択ボタン
        SizedBox(
          width: 100,
          height: 100,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              elevation: 2,
              foregroundColor: noSelectForeColor,
              backgroundColor: noSelectBackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _selectNoSelectRadio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isNoSelectIconVisible ? const Icon(Icons.check) : Container(),
                const Text('未選択',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        )
      ],
    );
  }

  // メソッド群
  /// 色を初期状態に戻す
  void _resetColor() {
    setState(() {
      manBackColor = Colors.white;
      womanBackColor = Colors.white;
      noSelectBackColor = Colors.white;

      manForeColor = Colors.blueAccent;
      womanForeColor = Colors.blueAccent;
      noSelectForeColor = Colors.blueAccent;

      isManIconVisible = false;
      isWoManIconVisible = false;
      isNoSelectIconVisible = false;
    });
  }

  /// 男性ラジオボタン選択時
  void _selectManRadio() {
    setState(() {
      _resetColor();
      manBackColor = Colors.blueAccent;
      manForeColor = Colors.white;
      isManIconVisible = true;
    });
    widget.selectionChanged(GenderEnum.man);
  }

  /// 女性ラジオボタン選択時
  void _selectWoManRadio() {
    setState(() {
      _resetColor();
      womanBackColor = Colors.blueAccent;
      womanForeColor = Colors.white;
      isWoManIconVisible = true;
    });
    widget.selectionChanged(GenderEnum.woman);
  }

  /// 未選択ラジオボタン選択時
  void _selectNoSelectRadio() {
    setState(() {
      _resetColor();
      noSelectBackColor = Colors.blueAccent;
      noSelectForeColor = Colors.white;
      isNoSelectIconVisible = true;
    });
    widget.selectionChanged(GenderEnum.noSelect);
  }
}
