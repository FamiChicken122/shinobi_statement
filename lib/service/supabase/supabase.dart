import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

// サンプル
Future<List> fetchCharacters() async {
  try {
    final response = await supabase
        .from('character') // テーブル名
        .select(); // 全ての列を選択; // 作成日時で降順ソート

    return response;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}
