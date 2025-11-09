import 'package:flutter_bloc/flutter_bloc.dart';

import 'character_bloc.dart';
import 'scenario_bloc.dart';

final _character = BlocProvider(create: (_) => CharacterBloc());
final _scenario = BlocProvider(create: (_) => ScenarioBloc());

final multiBlocProvider = [_character, _scenario];
