import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shinobi_statement/service/riverpod/riverpod.dart';
import 'package:shinobi_statement/src/common_component/common_component.dart';

class ScenarioScreen extends ConsumerWidget {
  const ScenarioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.read(characterProvider);
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
          characters.when(
            data: (items) {
              print(items.first.keys.first == "" ? "AAA" : "BBB");
              return items.first.keys.first;
            },
            error: (_, __) => "",
            loading: () => "",
          ),
        ),
      ],
    );
  }
}
