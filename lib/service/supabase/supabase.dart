import 'package:supabase_flutter/supabase_flutter.dart';

import 'data_class.dart';

final _supabase = Supabase.instance.client;

Stream<Map<int, Character>> subscribeCharacters() {
  try {
    final response = _supabase
        .from('character')
        .stream(primaryKey: ['character_id'])
        .map((list) {
          final map = <int, Character>{};
          for (final record in list) {
            final id = record['character_id'];
            final character = Character(
              id: id,
              scenarioId: record['scenario_id'],
              name: record['character_name'],
              isPc: record['is_pc'],
              hasSecret: record['has_secret'],
              hasLocation: record['has_location'],
              hasEmotion: record['has_emotion'],
              isPublic: record['is_public'],
              secretDetail: record['secret_detail'],
              sheetUrl: record['sheet_url'],
            );
            map[id] = character;
          }
          return map;
        });

    return response;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}

Stream<Map<int, Scenario>> subscribeScenarios() {
  try {
    final response = _supabase
        .from('scenario')
        .stream(primaryKey: ['scenario_id'])
        .map((list) {
          final map = <int, Scenario>{};
          for (final record in list) {
            final id = record['scenario_id'];
            final scenario = Scenario(
              id: id,
              name: record['scenario_name'],
              createdBy: record['created_by'] ?? '',
            );
            map[id] = scenario;
          }
          return map;
        });

    return response;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}

Future<Map<int, SkillsList>> fetchSkillsList() async {
  try {
    final response = await _supabase.from('skills_list').select();
    final map = <int, SkillsList>{};
    for (final record in response) {
      final id = record['skills_id'];
      final skillsList = SkillsList(
        id: id,
        field: record['skills_field'],
        name: record['skills_name'],
      );
      map[id] = skillsList;
    }
    return map;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}

Future<Map<int, EmotionsList>> fetchEmotionsList() async {
  try {
    final response = await _supabase.from('emotions_list').select();
    final map = <int, EmotionsList>{};
    for (final record in response) {
      final id = record['emotions_list_id'];
      final emotionsList = EmotionsList(
        id: id,
        isPlus: record['is_plus_function'],
        name: record['emotion_name'],
      );
      map[id] = emotionsList;
    }
    return map;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}

Future<Map<int, UnwellsList>> fetchUnwellsList() async {
  try {
    final response = await _supabase.from('unwells_list').select();
    final map = <int, UnwellsList>{};
    for (final record in response) {
      final id = record['unwells_list_id'];
      final unwellsList = UnwellsList(
        id: id,
        name: record['unwell_name'],
        function: record['unwell_function'],
        refreshSkillId: record['refresh_skill_id'],
        isSengoku: record['is_sengoku_regulation'],
      );
      map[id] = unwellsList;
    }
    return map;
  } catch (error) {
    print('データの取得に失敗しました: $error');
    throw Exception();
  }
}
