import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/supabase/data_class.dart';

import '../supabase/supabase.dart';

abstract class _ScenarioEvent {}

class FetchEvent extends _ScenarioEvent {}

class ScenarioState {
  const ScenarioState({required this.scenario});

  final Map<int, Scenario> scenario;
}

class ScenarioBloc extends Bloc<_ScenarioEvent, ScenarioState> {
  ScenarioBloc() : super(ScenarioState(scenario: {})) {
    on<FetchEvent>(_onFetch);
    add(FetchEvent());
  }

  Future<void> _onFetch(FetchEvent event, Emitter<ScenarioState> emit) async {
    await emit.forEach<Map<int, Scenario>>(
      subscribeScenarios(),
      onData: (data) => ScenarioState(scenario: data),
      onError: (_, __) => ScenarioState(scenario: {}),
    );
  }
}
