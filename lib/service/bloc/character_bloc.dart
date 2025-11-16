import 'package:flutter_bloc/flutter_bloc.dart';

import '../supabase/supabase.dart';
import '../supabase/data_class.dart';

abstract class _CharacterEvent {
  const _CharacterEvent();
}

class FetchEvent extends _CharacterEvent {
  const FetchEvent({required this.scenarioId});
  final int scenarioId;
}

class CharacterBloc extends Bloc<_CharacterEvent, CharacterRecords> {
  CharacterBloc() : super(CharacterRecords()) {
    on<FetchEvent>(_onFetch);
  }

  Future<void> _onFetch(
    FetchEvent event,
    Emitter<CharacterRecords> emit,
  ) async {
    await emit.forEach<CharacterRecords>(
      subscribeCharacters(),
      onData: (data) {
        final map = <int, Character>{};
        data.forEach((id, character) {
          if (character.scenarioId == event.scenarioId) {
            map[id] = character;
          }
        });
        return map;
      },
      onError: (error, stackTrace) => CharacterRecords(),
    );
  }
}

extension CharacterExtension on CharacterRecords {
  List<Character> get _characterList {
    final sortedKeys = keys.toList()..sort();
    final list = <Character>[];
    for (final key in sortedKeys) {
      list.add(this[key]!);
    }
    return list;
  }

  List<List<String>> toList() {
    final list = <List<String>>[];
    list.add(['名前', 'PC', '秘密', '居所', '感情', 'URL']);
    for (final character in _characterList) {
      list.add([
        character.name,
        character.isPc ? "PC" : "NPC",
        character.hasSecret ? "◯" : "",
        character.hasLocation ? "◯" : "",
        character.hasEmotion ? "◯" : "",
        character.sheetUrl ?? "",
      ]);
    }
    return list;
  }

  int get maxNameLength {
    int length = 4;
    for (final character in values) {
      final name = character.name;
      if (name.length > length) length = name.length;
    }
    return length;
  }

  Map<(int, int), String> get secretDetails {
    final map = <(int, int), String>{};
    for (int i = 0; i < length; i++) {
      final character = _characterList[i];
      map[(i + 1, 0)] = character.secretDetail ?? 'Secret';
    }
    return map;
  }
}
