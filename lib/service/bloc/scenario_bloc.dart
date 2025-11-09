import 'package:flutter_bloc/flutter_bloc.dart';

import '../supabase/supabase.dart';

abstract class _ScenarioEvent {}

class FetchEvent extends _ScenarioEvent {}

class ScenarioState {
  const ScenarioState({required this.scenario});

  final List<Map<String, dynamic>> scenario;
}

class ScenarioBloc extends Bloc<_ScenarioEvent, ScenarioState> {
  ScenarioBloc() : super(ScenarioState(scenario: [])) {
    on<FetchEvent>(_onFetch);
    add(FetchEvent());
  }

  Future<void> _onFetch(FetchEvent event, Emitter<ScenarioState> emit) async {
    await emit.forEach<List<Map<String, dynamic>>>(
      fetchScenarios(),
      onData: (data) => ScenarioState(scenario: data),
    );
  }
}
