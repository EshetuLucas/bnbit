import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    Key? key,
    this.size = 0.5,
    this.title,
    this.onBack,
  }) : super(key: key);
  final double size;
  final VoidCallback? onBack;
  final Widget? title;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: onBack ?? () => Navigator.pop(context),
        child: Icon(
          CupertinoIcons.back,
          color: Theme.of(context).colorScheme.primary,
          size: 25,
        ),
      ),
      title: title,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Theme.of(context).colorScheme.onBackground,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
