import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/supabase/data_class.dart';

import '../supabase/supabase.dart';

abstract class _CharacterEvent {}

class FetchEvent extends _CharacterEvent {}

class CharacterState {
  const CharacterState({required this.characters});

  final Map<int, Character> characters;
}

class CharacterBloc extends Bloc<_CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterState(characters: {})) {
    on<FetchEvent>(_onFetch);
    add(FetchEvent());
  }

  Future<void> _onFetch(FetchEvent event, Emitter<CharacterState> emit) async {
    await emit.forEach<Map<int, Character>>(
      subscribeCharacters(),
      onData: (data) => CharacterState(characters: data),
      onError: (error, stackTrace) => CharacterState(characters: {}),
    );
  }
}
