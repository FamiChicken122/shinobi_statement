import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/src/screens/screen.dart';

import '../../service/bloc/screen_bloc.dart';
import '../../service/bloc/character_bloc.dart';
import '../../service/supabase/data_class.dart';
import '../common_component/common_component.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, screenState) {
        return BlocBuilder<CharacterBloc, CharacterRecords>(
          builder: (context, characterRecords) {
            return CommonPane(
              selected: screenState.currentScreen,
              onTapScreenButton: (Screen screen) =>
                  context.read<ScreenBloc>().add(
                    ShowScreenEvent(
                      screen: screen,
                    ),
                  ),
            );
          },
        );
      },
    );
  }
}
