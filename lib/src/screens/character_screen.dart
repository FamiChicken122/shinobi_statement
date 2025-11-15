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
        return _FixedColumnTableScreen(
          data: characterRecords.toList(),
          nameLength: characterRecords.maxNameLength,
        );
      },
    );
  }
}

extension CharacterExtension on CharacterRecords {
  List<List<String>> toList() {
    final list = <List<String>>[];
    list.add(['名前', 'PC', '秘密', '居所', '感情', 'URL']);
    forEach((key, value) {
      list.add([
        value.name,
        value.isPc ? "PC" : "NPC",
        value.hasSecret ? "◯" : "",
        value.hasLocation ? "◯" : "",
        value.hasEmotion ? "◯" : "",
        value.sheetUrl ?? "",
      ]);
    });
    return list;
  }

  int get maxNameLength {
    int length = 0;
    for (final character in values) {
      final name = character.name;
      if (name.length > length) length = name.length;
    }
    return length;
  }
}

final double _cellHeight = 50.0;
final double _scrollableColumnWidth = 80.0;

class _FixedColumnTableScreen extends StatelessWidget {
  const _FixedColumnTableScreen({required this.data, required this.nameLength});

  final List<List<String>> data;
  final int nameLength;

  @override
  Widget build(BuildContext context) {
    final headerData = data.removeAt(0);
    final double nameWidth = nameLength * 20;
    final list = <List<Widget>>[];
    for (int i = 0; i < headerData.length; i++) {
      list.add([]);
      final isStart = i == 0;
      final headerCell = _buildHeaderCell(
        headerData[i],
        isStart ? nameWidth : _scrollableColumnWidth,
        isStart ? Colors.blueGrey : Colors.blueGrey.shade700,
      );
      list[i].add(headerCell);
    }
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < headerData.length; j++) {
        final isStart = j == 0;
        final cell = _buildDataCell(
          data[i][j],
          isStart ? nameWidth : _scrollableColumnWidth,
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
    return Container(
      width: width,
      height: _cellHeight,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(text, overflow: TextOverflow.ellipsis),
    );
  }
}
