part of '../common_component.dart';

final double _cellHeight = 50.0;

/// rowtoolChips: 出力テーブルの◯行◯列にToolchipsを付加
class CommonTable extends StatelessWidget {
  const CommonTable({
    super.key,
    required this.data,
    required this.firstCellWidth,
    required this.cellWidth,
    this.toolChips,
  });

  final List<List<String>> data;
  final double firstCellWidth;
  final double cellWidth;
  final Map<(int rowIndex, int columnIndex), String>? toolChips;

  @override
  Widget build(BuildContext context) {
    final headerData = data.removeAt(0);
    final list = <List<Widget>>[];
    for (int i = 0; i < headerData.length; i++) {
      list.add([]);
      final isStart = i == 0;
      final width = isStart ? firstCellWidth : cellWidth;
      Widget headerCell = _buildHeaderCell(
        headerData[i],
        width,
        isStart ? Colors.blueGrey : Colors.blueGrey.shade700,
      );
      if (toolChips?.containsKey((0, i)) ?? false) {
        headerCell = Tooltip(
          constraints: BoxConstraints(maxWidth: 600),
          message: toolChips![(0, i)],
          textStyle: TextStyle(color: commonColors.textWhite, fontSize: 24),
          child: headerCell,
        );
      }
      list[i].add(headerCell);
    }
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < headerData.length; j++) {
        final isStart = j == 0;
        final width = isStart ? firstCellWidth : cellWidth;
        Widget cell = _buildDataCell(
          data[i][j],
          width,
          isStart ? Colors.white : Colors.grey.shade50,
          isStart ? Alignment.centerLeft : Alignment.center,
        );
        if (toolChips?.containsKey((i + 1, j)) ?? false) {
          cell = Tooltip(
            constraints: BoxConstraints(maxWidth: 600),
            message: toolChips![(i + 1, j)],
            textStyle: TextStyle(color: commonColors.textWhite, fontSize: 24),
            child: cell,
          );
        }

        list[j].add(cell);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final column in list)
                Column(
                  children: column,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, double width, Color color) {
    return Container(
      width: width,
      height: _cellHeight,
      color: color,
      alignment: Alignment.center,
      child: CommonText.whiteBasic(text),
    );
  }

  Widget _buildDataCell(
    String text,
    double width,
    Color color,
    Alignment alignment,
  ) {
    StatelessWidget widget(Widget child) {
      return Container(
        width: width,
        height: _cellHeight,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
        ),
        alignment: alignment,
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

// パワポもsvg化できるんだというのが驚きでした（描画の仕組みは同じなので確かにという感じ）
// 自分で作成するに当たってエディターなどおすすめのものがあったりしますか？　作成が楽になるツールなどあれば知りたいです
