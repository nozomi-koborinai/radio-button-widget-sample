import 'package:radio_sample/custom_radio.dart';

/// データ登録に行くまでの間に入力データを一時保存しておくためのクラス
/// いろんな箇所でインスタンスを作られると、データが意図しない箇所で置き換わって都合が悪いのでシングルトン構造にする
/// 呼び出し方：Store.instance.hogehoge
class Store {
  /// プライベートコンストラクタ（外部からはnewできない）
  Store._();

  /// singleton
  static final instance = Store._();

  /// 入力した氏名
  String name = '';

  /// 入力した氏名（カナ）
  String kanaName = '';

  /// 入力した郵便番号
  String post = '';

  /// 選択した性別
  GenderEnum gender = GenderEnum.noSelect;
}
