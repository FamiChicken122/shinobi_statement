part of '../common_component.dart';

class CommonFloatingButton extends StatelessWidget {
  const CommonFloatingButton({
    super.key,
    required this.title,
    required this.onTap,
    this.child,
    this.backgroundColor,
    this.padding,
  });

  final String title;
  final VoidCallback onTap;
  final Widget Function(String label)? child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(_buttonPadding),
      child: FloatingActionButton.extended(
        backgroundColor: backgroundColor ?? commonColors.buttonBackGround,
        label: child != null ? child!(title) : CommonText.whiteBasic(title),
        onPressed: onTap,
      ),
    );
  }
}
