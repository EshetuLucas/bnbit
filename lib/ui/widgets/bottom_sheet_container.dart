import 'package:flutter/material.dart';

import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: child,
          ),
        ),
        DecoratedContainer(
          child: Container(
            height: 4,
            width: 33,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
