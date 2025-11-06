part of '../common_component.dart';

const _contentPadding = 8.0;

class CommonSelection<T> extends StatefulWidget {
  CommonSelection({
    super.key,
    required this.values,
    required this.label,
    this.defaultValue,
    this.onChanged,
    this.title,
  }) : assert(values.isNotEmpty);

  final List<T> values;
  final String Function(T value) label;
  final T? defaultValue;
  final void Function(T value)? onChanged;
  final String? title;

  @override
  State<CommonSelection<T>> createState() => _CommonSelectionState();
}

class _CommonSelectionState<T> extends State<CommonSelection<T>> {
  _CommonSelectionState();
  late int currentValue;
  @override
  void initState() {
    if (widget.defaultValue != null) {
      currentValue = widget.values.indexOf(widget.defaultValue as T);
    } else {
      currentValue = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: _contentPadding),
            child: CommonText.whiteBasic(widget.title!),
          ),
        CommonUpDownButton(
          direction: Direction.up,
          disabled: currentValue >= widget.values.length - 1,
          onTap: () {
            setState(() {
              currentValue++;
              widget.onChanged?.call(widget.values[currentValue]);
            });
          },
        ),
        const SizedBox(height: _contentPadding),
        Container(
          decoration: BoxDecoration(
            color: commonColors.buttonBackGround,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: commonColors.textWhite),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonText.whiteBasic(
              widget.label(widget.values[currentValue]),
            ),
          ),
        ),
        const SizedBox(height: _contentPadding),
        CommonUpDownButton(
          direction: Direction.down,
          disabled: currentValue <= 0,
          onTap: () {
            setState(() {
              currentValue--;
              widget.onChanged?.call(widget.values[currentValue]);
            });
          },
        ),
      ],
    );
  }
}
