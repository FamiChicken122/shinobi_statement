part of '../common_component.dart';

const _leftList = [
  Screen.character,
  Screen.publicInfo,
  Screen.secret,
  Screen.place,
];
const _rightList = [
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
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              for (final screen in _leftList) ...[
                _Chip(
                  screen: screen,
                  onTap: () => onTapScreenButton(screen),
                  isSelected: selected == screen,
                ),
              ],
            ],
          ),
        ),
        Spacer(flex: 4),
        Expanded(
          child: Column(
            children: [
              for (final screen in _rightList) ...[
                _Chip(
                  screen: screen,
                  onTap: () => onTapScreenButton(screen),
                  isSelected: selected == screen,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.screen,
    required this.onTap,
    required this.isSelected,
  });

  final Screen screen;
  final void Function() onTap;
  final bool isSelected;

  // ここらへんの動作がアカン

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? commonColors.textBlack
        : commonColors.buttonBackGround;
    return Stack(
      // fit: StackFit.expand,
      children: [
        ColoredBox(color: color),
        GestureDetector(
          child: CommonText.whiteTitle(screen.name),
          onTap: () => onTap,
        ),
      ],
    );
  }
}
