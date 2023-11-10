import 'package:flutter/material.dart';

import 'app_colors.dart';

// Box Decorations
BoxDecoration kdbFieldDecortaionLight =
    BoxDecoration(borderRadius: kdbDefaultBorderRadius, color: kcDark700);

BoxDecoration kdbDefaultBoxDecoration = BoxDecoration(
  border: Border.all(
    color: kcBorderColor,
    width: 1,
  ),
  color: kcWhite,
  borderRadius: kdbDefaultBorderRadius,
);

// Box Decorations
BorderRadius kdbDefaultBorderRadius = BorderRadius.circular(10);

// Card and Container shape
const RoundedRectangleBorder krrBoxBorderShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
  Radius.circular(8),
));

OutlineInputBorder kbOutlineInputBorderError = OutlineInputBorder(
  borderSide: const BorderSide(
    color: kcRed,
    width: 1,
  ),
  borderRadius: kdbDefaultBorderRadius,
);
