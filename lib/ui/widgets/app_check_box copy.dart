import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    this.isSelected = false,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: 18,
      child: DecoratedContainer(
        borderColor: isSelected
            ? kcPrimaryColor
            : Theme.of(context).colorScheme.surface.withOpacity(0.5),
        borderRadius: 4,
        containerColor: Theme.of(context).colorScheme.tertiary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: 19,
            width: 19,
            child: isSelected
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: kcPrimaryColor,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
