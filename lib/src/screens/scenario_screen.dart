import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/bloc/character_bloc.dart';
import '../common_component/common_component.dart';

class ScenarioScreen extends StatelessWidget {
  const ScenarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommonSelection<String>(
                  values: ["A", "B", "C", "D"],
                  label: (value) => switch (value) {
                    "A" => "A",
                    "B" => "B",
                    "C" => "C",
                    "D" => "D",
                    _ => "",
                  },
                ),
                CommonFloatingButton(title: 'title', onTap: () => {}),
              ],
            ),
            CommonUpDownButton(direction: Direction.up, onTap: () => {}),
            CommonText.title(
              state.characters.isEmpty
                  ? 'test'
                  : state.characters.first.entries.first.key,
            ),
          ],
        );
      },
    );
  }
}
