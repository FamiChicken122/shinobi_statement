import 'package:flutter/material.dart';
import 'package:shinobi_statement/src/common_component/common_component.dart';

class ScenarioScreen extends StatelessWidget {
  const ScenarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        CommonText.title(''),
      ],
    );
  }
}
