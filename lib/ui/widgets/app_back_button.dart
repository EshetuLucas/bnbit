import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    this.onTap,
    this.padding,
  }) : super(key: key);
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: const Icon(
          Icons.arrow_back,
          size: 20,
        ),
      ),
    );
  }
}
