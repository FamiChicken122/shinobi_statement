part of '../common_component.dart';

const _list = [
  Screen.character,
  Screen.publicInfo,
  Screen.secret,
  Screen.place,
  Screen.ougi,
  Screen.emotion,
  Screen.unwell,
  Screen.combatEffect,
];

class CommonPane extends StatelessWidget {
  const CommonPane({
    super.key,
    required this.selected,
    required this.onTapScreenButton,
  });

  final Screen selected;
  final void Function(Screen screen) onTapScreenButton;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonHeight = constraints.maxHeight / 8;
        final buttonWidth = constraints.maxWidth / 6;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (final screen in _list) ...[
              _Chip(
                screen: screen,
                onTap: () => onTapScreenButton(screen),
                isSelected: screen == selected,
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
              ),
            ],
          ],
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.screen,
    required this.onTap,
    required this.isSelected,
    required this.buttonWidth,
    required this.buttonHeight,
  });

  final Screen screen;
  final void Function() onTap;
  final bool isSelected;
  final double buttonWidth;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? commonColors.textBlack : null;
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: CommonFloatingButton(
        backgroundColor: color,
        title: screen.paneTitle,
        onTap: onTap,
      ),
    );
  }
}
