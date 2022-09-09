import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ExcusesPageTransitionSwitcher extends StatelessWidget {
  const ExcusesPageTransitionSwitcher({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation, secondAnimation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      child: child,
    );
  }
}
