import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common_component/common_component.dart';
import '../../service/bloc/screen_bloc.dart';
import 'screen.dart';

class ScreenBase extends StatelessWidget {
  const ScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        final mainScreen = switch (state.currentScreen) {
          Screen.scenario => Screen.scenario.screenWidget,
          _ => Row(
            children: [
              CommonPane(
                selected: state.currentScreen,
                onTapScreenButton: (Screen screen) {
                  context.read<ScreenBloc>().add(
                    ShowScreenEvent(screen: screen),
                  );
                },
                paneWidth: 220.0,
              ),
              Expanded(child: state.currentScreen.screenWidget),
            ],
          ),
        };
        return SizedBox.fromSize(
          size: size,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: mainScreen,
              ),
              SizedBox(height: 80, child: _BackButtonBar()),
            ],
          ),
        );
      },
    );
  }
}

class _BackButtonBar extends StatelessWidget {
  const _BackButtonBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            if (state.currentScreen != Screen.scenario)
              SizedBox(
                width: 300,
                child: CommonFloatingButton(
                  title: 'Back',
                  onTap: () =>
                      context.read<ScreenBloc>().add(const BackHomeEvent()),
                ),
              ),
            Center(child: CommonText.title(state.currentScreen.shownName)),
          ],
        );
      },
    );
  }
}
