import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/bloc/character_bloc.dart';
import '../../service/bloc/scenario_bloc.dart';
import '../../service/bloc/screen_bloc.dart';
import '../../service/supabase/data_class.dart';
import '../colors/colors.dart';
import 'screen.dart';

import '../common_component/common_component.dart';

class ScenarioScreen extends StatelessWidget {
  const ScenarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScenarioBloc, ScenarioRecords>(
      builder: (context, records) {
        records[0] = Scenario(id: 0, name: 'シナリオ名');
        return ListView.builder(
          itemCount: records.length,
          itemBuilder: (context, index) {
            return _Scenario(scenario: records[index]!);
          },
        );
      },
    );
  }
}

class _Scenario extends StatelessWidget {
  const _Scenario({required this.scenario});

  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    if (scenario.id == 0) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 240,
                child: Center(child: CommonText.title('シナリオID')),
              ),
              Expanded(child: Center(child: CommonText.title(scenario.name))),
            ],
          ),
          Divider(
            color: commonColors.textBlack,
            height: 1,
          ),
        ],
      );
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 240,
              child: Center(child: CommonText.title(scenario.id.toString())),
            ),
            Expanded(
              child: CommonFloatingButton(
                onTap: () {
                  context.read<CharacterBloc>().add(
                    FetchEvent(scenarioId: scenario.id),
                  );
                  context.read<ScreenBloc>().add(
                    ShowScreenEvent(screen: Screen.character),
                  );
                },
                title: scenario.name,
                child: (String name) {
                  return Row(
                    children: [
                      CommonText.whiteTitle(scenario.name),
                      const Icon(Icons.chevron_right),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        Divider(
          color: commonColors.textBlack,
          height: 1,
        ),
      ],
    );
  }
}
