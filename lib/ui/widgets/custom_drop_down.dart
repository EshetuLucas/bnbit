// import 'package:dropdown_button2/dropdown_button2.dart';

// import 'package:bnbit_app/ui/common/app_colors.dart';
// import 'package:bnbit_app/ui/common/ui_helpers.dart';
// import 'package:flutter/material.dart';

// import '../common/shared_styles.dart';

// class CustomDropDown<T> extends StatelessWidget {
//   const CustomDropDown({
//     Key? key,
//     this.onChanged,
//     this.hint,
//     required this.items,
//     this.backgroundColor,
//     this.textColor,
//     this.buttonHeight = 10,
//     this.itemHeight = 60,
//     this.dropdownWidth = 170,
//     this.borderRadius,
//     this.offset = const Offset(0, -4),
//     this.title = '',
//   }) : super(key: key);

//   final Widget? hint;
//   final Function(T?)? onChanged;
//   final List<T> items;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final double buttonHeight;
//   final double itemHeight;
//   final double dropdownWidth;
//   final Offset offset;
//   final BorderRadius? borderRadius;
//   final String title;

//   String getId(T item) {
//     switch (T) {
//       case String:
//         item as String;
//         return item;

//       default:
//         return '1';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<T>(
//         customButton: hint ??
//             const Icon(
//               Icons.language,
//               color: Theme.of(context).colorScheme. onPrimaryContainer,
//             ),
//         buttonHeight: buttonHeight,
//         buttonWidth: 8,
//         itemHeight: itemHeight,
//         items: [
//           ...items.map(
//             (item) => DropdownMenuItem<T>(
//               value: item,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   verticalSpaceSmall,
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                     child: Text(
//                       "$title " + getId(item),
//                       style: ktsSmallDarkTextStyle.copyWith(
//                         fontSize: 15,
//                         color: textColor??kcDark,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       softWrap: true,
//                       maxLines: 1,
//                     ),
//                   ),
//                   const Divider(
//                     color: kcBackgroundColor,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//         onChanged: (value) {
//           onChanged?.call(value);
//         },
//         itemPadding: const EdgeInsets.only(left: 10, right: 10),
//         dropdownWidth: dropdownWidth,
//         dropdownPadding: const EdgeInsets.symmetric(vertical: 10),
//         dropdownDecoration: BoxDecoration(
//           borderRadius: borderRadius ??
//               const BorderRadius.only(
//                 bottomLeft: Radius.circular(8),
//                 bottomRight: Radius.circular(8),
//                 topLeft: Radius.circular(8),
//               ),
//           color: Theme.of(context).colorScheme. tertiary,
//         ),
//         dropdownElevation: 8,
//         offset: offset,
//       ),
//     );
//   }
// }
