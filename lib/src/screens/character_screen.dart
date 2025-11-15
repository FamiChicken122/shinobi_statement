import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        return _FixedColumnTableScreen(
          data: characterRecords.toList(),
          maxNameLength: characterRecords.maxNameLength,
        );
      },
    );
  }
}

final double _cellHeight = 50.0;
final double _cellWidth = 160.0;

class _FixedColumnTableScreen extends StatelessWidget {
  const _FixedColumnTableScreen({
    required this.data,
    required this.maxNameLength,
  });

  final List<List<String>> data;
  final int maxNameLength;

  @override
  Widget build(BuildContext context) {
    final headerData = data.removeAt(0);
    final double nameWidth = maxNameLength * 40;
    final list = <List<Widget>>[];
    for (int i = 0; i < headerData.length; i++) {
      list.add([]);
      final isStart = i == 0;
      final headerCell = _buildHeaderCell(
        headerData[i],
        isStart ? nameWidth : _cellWidth,
        isStart ? Colors.blueGrey : Colors.blueGrey.shade700,
      );
      list[i].add(headerCell);
    }
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < headerData.length; j++) {
        final isStart = j == 0;
        final cell = _buildDataCell(
          data[i][j],
          isStart ? nameWidth : _cellWidth,
          isStart ? Colors.white : Colors.grey.shade50,
        );
        list[j].add(cell);
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final column in list)
            Column(
              children: column,
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, double width, Color color) {
    return Container(
      width: width,
      height: _cellHeight,
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, double width, Color color) {
    StatelessWidget widget(Widget child) {
      return Container(
        width: width,
        height: _cellHeight,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: child,
      );
    }

    if (text.contains('https://')) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          await launchUrlString(text);
        },
        child: widget(
          CommonText.blueBasic(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    } else {
      return widget(
        CommonText.blackBasic(
          text,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
  }
}
