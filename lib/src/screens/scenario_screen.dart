import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/bloc/bloc.dart';
import 'package:shinobi_statement/src/common_component/common_component.dart';

class ScenarioScreen extends StatelessWidget {
  const ScenarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        print(state.characters);
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
            // CommonText.title(state.characters.first.entries.first.key),
          ],
        );
      },
    );
  }
}
