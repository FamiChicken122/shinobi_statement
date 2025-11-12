import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/supabase/data_class.dart';

import '../supabase/supabase.dart';

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
