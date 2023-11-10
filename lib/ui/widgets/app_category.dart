import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AppCategory extends StatelessWidget {
  const AppCategory({
    Key? key,
    required this.text,
    this.active = false,
    this.onTap,
    this.padding,
    this.height,
    this.width,
    this.textStyle,
    this.lighterVersion = false,
    this.alignment,
    this.borderActive = true,
    this.loading = false,
    this.hasSubCategory = false,
  }) : super(key: key);

  final Alignment? alignment;
  final bool active;
  final Function()? onTap;
  final String text;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final bool lighterVersion;
  final bool borderActive;
  final bool loading;
  final bool hasSubCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            shadowColor: Theme.of(context).colorScheme.primary,
            surfaceTintColor: Theme.of(context).colorScheme.primary,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            elevation: active ? 12 : 1,
            child: SkeletonLoader(
              startColor: Theme.of(context).colorScheme.tertiary,
              endColor: Theme.of(context).colorScheme.tertiaryContainer,
              loading: loading,
              child: Container(
                height: height,
                width: width,
                alignment: alignment,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(active ? 8 : 2),
                  ),
                  color: Theme.of(context).colorScheme.tertiary,
                  border: borderActive
                      ? active
                          ? Border.all(
                              color: Theme.of(context).colorScheme.primary)
                          : null
                      : null,
                ),
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  text,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: textStyle ??
                      (active
                          ? ktsBoldMeidumDarkTextStyle(context).copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : ktsDarkSmallTextStyle(context).copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.6))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
