import 'package:animations/animations.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ExcusePageView extends StatelessWidget {
  final List<Excuse>? excuses;
  final int? currentExcuse;

  const ExcusePageView({Key? key, this.excuses, this.currentExcuse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedExcuse =
        excuses!.firstWhere((element) => element.id == currentExcuse);

    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation, secondAnimation) {
        return SharedAxisTransition(
          child: child,
          animation: animation,
          secondaryAnimation: secondAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
        );
      },
      child: ExcuseCard.fromExcuse(selectedExcuse),
    );
  }
}
