import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/service/bloc/scenario_bloc.dart';
import 'package:shinobi_statement/service/supabase/data_class.dart';

import '../common_component/common_component.dart';

class ScenarioScreen extends StatelessWidget {
  const ScenarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScenarioBloc, ScenarioRecords>(
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
            _TestWidget(state),
          ],
        );
      },
    );
  }
}

class _TestWidget extends StatelessWidget {
  const _TestWidget(this.state);

  final ScenarioRecords state;

  @override
  Widget build(BuildContext context) {
    if (state.isEmpty) {
      return CommonText.title("Empty");
    }

    final widgets = <Widget>[];
    state.forEach((key, value) {
      widgets.add(CommonText.title(key.toString()));
      widgets.add(CommonText.title(value.name));
    });
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return ListTile(title: widgets[index]);
        },
      ),
    );
  }
}
