import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/screens/screen.dart';

abstract class _ScreenEvent {
  const _ScreenEvent();
}

class BackHomeEvent extends _ScreenEvent {
  const BackHomeEvent();
}

class ShowScreenEvent extends _ScreenEvent {
  const ShowScreenEvent({required this.screen});
  final Screen screen;
}

class ShowModalEvent extends _ScreenEvent {
  const ShowModalEvent({required this.screen});
  final Screen screen;
}

class CloseModalEvent extends _ScreenEvent {
  const CloseModalEvent();
}

class ScreenState {
  const ScreenState({
    required this.currentScreen,
    this.overlayScreen,
  });

  final Screen currentScreen;
  final Screen? overlayScreen;

  ScreenState copyWith({
    Screen? currentScreen,
    Screen? overlayScreen,
  }) => ScreenState(
    currentScreen: currentScreen ?? this.currentScreen,
    overlayScreen: overlayScreen ?? this.overlayScreen,
  );
}

class ScreenBloc extends Bloc<_ScreenEvent, ScreenState> {
  ScreenBloc() : super(ScreenState(currentScreen: Screen.scenario)) {
    on<BackHomeEvent>(_onBackHome);
    on<ShowScreenEvent>(_onShowScreen);
    on<ShowModalEvent>(_onShowModal);
    on<CloseModalEvent>(_onCloseModal);
  }

  Future<void> _onBackHome(
    BackHomeEvent event,
    Emitter<ScreenState> emit,
  ) async {
    emit(ScreenState(currentScreen: Screen.scenario));
  }

  Future<void> _onShowScreen(
    ShowScreenEvent event,
    Emitter<ScreenState> emit,
  ) async {
    emit(ScreenState(currentScreen: event.screen));
  }

  Future<void> _onShowModal(
    ShowModalEvent event,
    Emitter<ScreenState> emit,
  ) async {
    emit(state.copyWith(overlayScreen: event.screen));
  }

  Future<void> _onCloseModal(
    CloseModalEvent event,
    Emitter<ScreenState> emit,
  ) async {
    emit(ScreenState(currentScreen: state.currentScreen));
  }
}
