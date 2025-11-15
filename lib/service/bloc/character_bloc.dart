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
  List<List<String>> toList() {
    final list = <List<String>>[];
    list.add(['名前', 'PC', '秘密', '居所', '感情', 'URL']);
    forEach((key, value) {
      list.add([
        value.name,
        value.isPc ? "PC" : "NPC",
        value.hasSecret ? "◯" : "",
        value.hasLocation ? "◯" : "",
        value.hasEmotion ? "◯" : "",
        value.sheetUrl ?? "",
      ]);
    });
    return list;
  }

  int get maxNameLength {
    int length = 0;
    for (final character in values) {
      final name = character.name;
      if (name.length > length) length = name.length;
    }
    return length;
  }
}
