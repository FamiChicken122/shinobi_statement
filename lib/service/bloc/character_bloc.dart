import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/supabase/data_class.dart';

import '../supabase/supabase.dart';

abstract class _CharacterEvent {}

class _FetchEvent extends _CharacterEvent {}

class CharacterBloc extends Bloc<_CharacterEvent, CharacterRecords> {
  CharacterBloc() : super(CharacterRecords()) {
    on<_FetchEvent>(_onFetch);
    add(_FetchEvent());
  }

  Future<void> _onFetch(
    _FetchEvent event,
    Emitter<CharacterRecords> emit,
  ) async {
    await emit.forEach<CharacterRecords>(
      subscribeCharacters(),
      onData: (data) => data,
      onError: (error, stackTrace) => CharacterRecords(),
    );
  }
}
