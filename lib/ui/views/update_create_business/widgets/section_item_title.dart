import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';

class SectionItemTitle extends StatelessWidget {
  const SectionItemTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: ktsSmall(context).copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: kcDark.withOpacity(0.8),
      ),
    );
  }
}