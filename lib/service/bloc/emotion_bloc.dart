import 'package:flutter_bloc/flutter_bloc.dart';

import '../supabase/supabase.dart';
import '../supabase/data_class.dart';

abstract class _EmotionEvent {
  const _EmotionEvent();
}

class _FetchEvent extends _EmotionEvent {
  const _FetchEvent();
}

class EmotionBloc extends Bloc<_EmotionEvent, Map<int, UnwellsList>> {
  EmotionBloc() : super(<int, UnwellsList>{}) {
    on<_FetchEvent>(_onFetch);
    add(_FetchEvent());
  }

  Future<void> _onFetch(
    _FetchEvent event,
    Emitter<Map<int, UnwellsList>> emit,
  ) async {
    final unwellsList = await fetchUnwellsList();

    emit(unwellsList);
  }
}

extension UnwellsListExt on Map<int, UnwellsList> {
  List<UnwellsList> get _list {
    final sortedKeys = keys.toList()..sort();
    final list = <UnwellsList>[];
    for (final key in sortedKeys) {
      list.add(this[key]!);
    }
    return list;
  }

  List<List<String>> toList() {
    final list = <List<String>>[];
    list.add(['変調名', '解除特技', 'レギュレーション']);
    for (final value in _list) {
      list.add([
        value.name,
        value.refreshSkillId.toString(),
        value.isSengoku ? '戦国' : '現代',
      ]);
    }
    return list;
  }

  Map<(int, int), String> get unwellsDetails {
    final map = <(int, int), String>{};
    for (int column = 0; column < length; column++) {
      final detail = _list[column].function;
      map[(column + 1, 0)] = detail;
    }
    return map;
  }
}

// unwellsListのデータを取得してるだけなので、Emotionのデータを取得するようにして
