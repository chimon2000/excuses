import 'package:animations/animations.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ExcusePageView extends StatelessWidget {
  final List<Excuse>? excuses;
  final int? currentPage;

  const ExcusePageView({Key? key, this.excuses, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var excuseCards =
        excuses!.map((excuse) => ExcuseCard.fromExcuse(excuse)).toList();

    return PageTransitionSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation, secondAnimation) {
        return SharedAxisTransition(
          child: child,
          animation: animation,
          secondaryAnimation: secondAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
        );
      },
      child: excuseCards[currentPage!],
    );
  }
}
