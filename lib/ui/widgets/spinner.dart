
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  final Color? color;
  final double size;

  const Spinner({
    Key? key,
    this.color,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return AspectRatio(
        aspectRatio: 1,
        child: CupertinoActivityIndicator(
            radius: size,
            color: color ?? Theme.of(context).colorScheme.primary),
      );
    }

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
              color ?? Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
