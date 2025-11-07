import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Stream<List<Map<String, dynamic>>> fetchCharacters() {
  try {
    final response = supabase
        .from('character')
        .stream(primaryKey: ['character_id'])
        .map((item) => item);

    return response;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}
