import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween('translateX', Tween(begin: 120.0, end: 0.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    return PlayAnimationBuilder(
        delay: Duration(milliseconds: (500 * delay).round()),
        tween: tween,
        duration: tween.duration,
        builder: (context, value, child) => Opacity(
              opacity: value.get("opacity"),
              child: Transform.translate(
                  offset: Offset(value.get("translateX"), 0), child: child),
            ),
        child: child);
  }
}
