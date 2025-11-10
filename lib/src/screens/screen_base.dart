import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/bloc/screen_bloc.dart';

import '../common_component/common_component.dart';

class ScreenBase extends StatelessWidget {
  const ScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 80, child: _BackButtonBar()),
                state.currentScreen.screenWidget,
              ],
            ),
          ],
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
            SizedBox(
              width: 300,
              child: CommonFloatingButton(title: 'Back', onTap: () => {}),
            ),
            Center(child: CommonText.title(state.currentScreen.name)),
          ],
        );
      },
    );
  }
}
