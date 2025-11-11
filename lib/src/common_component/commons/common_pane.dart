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
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        final buttonHeight = (screenHeight - 80) / 4;
        final buttonWidth = (screenWidth / 6).clamp(80.0, double.infinity);

        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  for (final screen in _leftList) ...[
                    Expanded(
                      child: _Chip(
                        screen: screen,
                        onTap: () => onTapScreenButton(screen),
                        isSelected: screen == selected,
                        buttonWidth: buttonWidth,
                        buttonHeight: buttonHeight,
                      ),
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
                    Expanded(
                      child: _Chip(
                        screen: screen,
                        onTap: () => onTapScreenButton(screen),
                        isSelected: screen == selected,
                        buttonWidth: buttonWidth,
                        buttonHeight: buttonHeight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
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
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: CommonFloatingButton(
        title: screen.name,
        onTap: onTap,
      ),
    );
  }
}
