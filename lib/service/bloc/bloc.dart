import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen_bloc.dart';
import 'character_bloc.dart';
import 'scenario_bloc.dart';
import 'emotion_bloc.dart';

final _screen = BlocProvider(create: (_) => ScreenBloc());
final _character = BlocProvider(create: (_) => CharacterBloc());
final _scenario = BlocProvider(create: (_) => ScenarioBloc());
final _emotion = BlocProvider(create: (_) => EmotionBloc(), lazy: false);

final multiBlocProvider = [_screen, _character, _scenario, _emotion];
