import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class ValidationText extends StatelessWidget {
  const ValidationText({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: kcRed.withOpacity(0.2)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: kcRed,
              ),
              horizontalSpace(9),
              Expanded(
                child: Text(title,
                    style: ktsDarkSmall(context)
                        .copyWith(color: kcRed, fontSize: 13)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
