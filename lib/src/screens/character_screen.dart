import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/bloc/screen_bloc.dart';
import '../../service/bloc/character_bloc.dart';
import '../../service/supabase/data_class.dart';
import '../common_component/common_component.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterRecords>(
      builder: (context, state) {
        return Column(
          children: [
            CommonUpDownButton(
              direction: Direction.up,
              onTap: () {
                context.read<ScreenBloc>().add(const BackHomeEvent());
              },
            ),
          ],
        );
      },
    );
  }
}
