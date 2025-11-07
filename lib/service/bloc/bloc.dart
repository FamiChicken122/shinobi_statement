import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/supabase/supabase.dart';

abstract class _CharacterEvent {}

class FetchEvent extends _CharacterEvent {}

class CharacterState {
  const CharacterState({required this.characters});

  final List<Map<String, dynamic>> characters;
}

class CharacterBloc extends Bloc<_CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterState(characters: [])) {
    on<FetchEvent>(_onFetch);
    add(FetchEvent());
  }

  Future<void> _onFetch(FetchEvent event, Emitter<CharacterState> emit) async {
    fetchCharacters().listen((data) {
      emit(CharacterState(characters: data));
    });
  }
}
