import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/bloc/character_bloc.dart';
import '../../service/supabase/data_class.dart';
import '../common_component/common_component.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterRecords>(
      builder: (context, characterRecords) {
        final widgets = <Widget>[];
        characterRecords.forEach((id, character) {
          widgets.add(
            CommonText.redTitle('${character.name}, ${character.sheetUrl}, '),
          );
        });
        return Column(
          children: widgets,
        );
      },
    );
  }
}
