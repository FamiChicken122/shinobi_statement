part of '../common_component.dart';

enum Direction {
  up,
  down,
}

class CommonUpDownButton extends StatelessWidget {
  const CommonUpDownButton({
    super.key,
    required this.direction,
    required this.onTap,
    this.disabled,
    this.color,
    this.size,
    this.backgroundColor,
    this.padding,
  });

  final Direction direction;
  final VoidCallback onTap;
  final bool? disabled;
  final Color? color;
  final double? size;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled ?? false,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(_buttonPadding),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            direction == Direction.up
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            color: disabled == true
                ? commonColors.background
                : color ?? commonColors.textWhite,
            size: size ?? _basicIconSize,
          ),
          color: backgroundColor ?? commonColors.textWhite,
        ),
      ),
    );
  }
}
