import 'package:supabase_flutter/supabase_flutter.dart';

final _supabase = Supabase.instance.client;

Stream<List<Map<String, dynamic>>> fetchCharacters() {
  try {
    final response = _supabase
        .from('character')
        .stream(primaryKey: ['character_id'])
        .map((item) => item);

    return response;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}

Stream<List<Map<String, dynamic>>> fetchScenarios() {
  try {
    final response = _supabase
        .from('scenario')
        .stream(primaryKey: ['scenario_id'])
        .map((item) => item);

    return response;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}
