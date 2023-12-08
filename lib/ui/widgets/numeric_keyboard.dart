library numeric_keyboard;

import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatelessWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final void Function(String text) onKeyboardTap;

  const NumericKeyboard({
    Key? key,
    required this.onKeyboardTap,
    this.textColor = Colors.black,
    this.rightButtonFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '1',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '2',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '3',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
            ],
          ),
          verticalSpaceSmall,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '4',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '5',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '6',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: [
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '7',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '8',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
              Expanded(
                child: _NumKey(
                  value: '9',
                  onTap: onKeyboardTap,
                ),
              ),
              horizontalSpaceTiny,
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: [
              horizontalSpaceSmall,
              Expanded(
                child: InkWell(
                    splashColor: kcMediumLightGrey.withOpacity(0.1),
                    onTap: leftButtonFn,
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: leftIcon,
                    )),
              ),
              Expanded(
                child: _NumKey(
                  value: '0',
                  onTap: onKeyboardTap,
                ),
              ),
              Expanded(
                child: InkWell(
                    borderRadius: BorderRadius.circular(45),
                    onTap: rightButtonFn,
                    child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: rightIcon)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _NumKey extends StatelessWidget {
  const _NumKey({
    required this.onTap,
    required this.value,
  });

  final void Function(String) onTap;
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kcMediumLightGrey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        onTap(value);
      },
      child: DecoratedContainer(
        containerColor: kcMediumLightGrey.withOpacity(0.1),
        elevation: 0,
        withCard: false,
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 40,
          child: Text(
            value,
            style: ktsSemibold(context),
          ),
        ),
      ),
    );
  }
}
