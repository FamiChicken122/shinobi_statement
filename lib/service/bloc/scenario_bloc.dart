import 'package:flutter_bloc/flutter_bloc.dart';

import '../supabase/supabase.dart';
import '../supabase/data_class.dart';

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

extension ScenarioRecordsExt on ScenarioRecords {
  int get createdByLength {
    int length = 0;
    for (final scenario in values) {
      final nameLength = scenario.createdBy.length;
      if (nameLength > length) {
        length = nameLength;
      }
    }
    return length;
  }
}
