import 'package:flutter/material.dart';

class FrostedBottomSheet extends StatelessWidget {
  final Widget? child;
  final double blurValue;
  final bool hasDraggableIndicator;
  final BorderRadius borderRadius;
  final Color? backgroundColor;

  const FrostedBottomSheet({
    Key? key,
    this.child,
    this.hasDraggableIndicator = true,
    this.blurValue = 0,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(6),
      topRight: Radius.circular(6),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasDraggableIndicator)
            const Center(
              child: _DraggableBottomSheetIndicator(),
            ),
          if (child != null) Flexible(child: child!),
        ],
      ),
    );
  }
}

class _DraggableBottomSheetIndicator extends StatelessWidget {
  const _DraggableBottomSheetIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: Colors.black38,
          width: 0.5,
        ),
      ),
    );
  }
}
