import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/bloc/screen_bloc.dart';
import 'package:shinobi_statement/src/screens/screen.dart';

import '../common_component/common_component.dart';

class ScreenBase extends StatelessWidget {
  const ScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        return SizedBox.fromSize(
          size: size,
          child: Stack(
            children: [
              SizedBox(height: 80, child: _BackButtonBar()),
              if (state.currentScreen != Screen.scenario)
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: CommonPane(
                    selected: state.currentScreen,
                    onTapScreenButton: (Screen screen) =>
                        context.read<ScreenBloc>().add(
                          ShowScreenEvent(
                            screen: screen,
                          ),
                        ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: state.currentScreen.screenWidget,
              ),
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
