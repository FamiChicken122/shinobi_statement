import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shinobi_statement/src/common_component/common_component.dart';

import '../../service/bloc/emotion_bloc.dart';

class EmotionScreen extends StatelessWidget {
  const EmotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final unwellsState = context.read<EmotionBloc>().state;
    final widget = <Widget>[];
    unwellsState.forEach((key, value) {
      widget.add(CommonText.blackBasic(value.name));
    });
    return CommonTable(
      data: unwellsState.toList(),
      firstCellWidth: 300,
      cellWidth: 400,
      toolChips: unwellsState.unwellsDetails,
    );
  }
}
