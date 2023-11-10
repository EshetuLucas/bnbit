import 'package:flutter/material.dart';

class WiggleEffect extends StatefulWidget {
  final Widget child;
  final bool enableAnimation;
  WiggleEffect({required this.child, required this.enableAnimation});
  @override
  _WiggleEffectState createState() => _WiggleEffectState();
}

class _WiggleEffectState extends State<WiggleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    animation = Tween<double>(
      begin: 0,
      end: 0.008,
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enableAnimation) {
      animationController.stop();
    } else {
      animationController.forward();
      animationController.repeat(reverse: true);
    }
    return RotationTransition(
      turns: animation,
      child: widget.child,
    );
  }
}
