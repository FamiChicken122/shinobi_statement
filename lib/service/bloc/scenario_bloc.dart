import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/supabase/data_class.dart';

import '../supabase/supabase.dart';

abstract class _ScenarioEvent {}

class _FetchEvent extends _ScenarioEvent {}

class ScenarioBloc extends Bloc<_ScenarioEvent, ScenarioRecords> {
  ScenarioBloc() : super(ScenarioRecords()) {
    on<_FetchEvent>(_onFetch);
    add(_FetchEvent());
  }

  Future<void> _onFetch(
    _FetchEvent event,
    Emitter<ScenarioRecords> emit,
  ) async {
    await emit.forEach<ScenarioRecords>(
      subscribeScenarios(),
      onData: (data) => data,
      onError: (_, __) => ScenarioRecords(),
    );
  }
}
