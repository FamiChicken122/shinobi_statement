import 'package:flutter/material.dart';
import 'package:shinobi_statement/src/common_component/common_component.dart';
import 'package:shinobi_statement/src/screens/scenario_screen.dart';

class ScreenBase extends StatelessWidget {
  const ScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80, child: _BackButtonBar()),
        Center(child: const ScenarioScreen()),
      ],
    );
  }
}

class _BackButtonBar extends StatelessWidget {
  const _BackButtonBar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        SizedBox(
          width: 300,
          child: CommonFloatingButton(title: 'Back', onTap: () => {}),
        ),
        Center(child: CommonText.title('Title')),
      ],
    );
  }
}
