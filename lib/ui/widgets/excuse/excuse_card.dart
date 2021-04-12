import 'package:excuses/models/models.dart';
import 'package:flutter/material.dart';

class ExcuseCard extends StatelessWidget {
  final Excuse? excuse;

  const ExcuseCard._({Key? key, this.excuse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        excuse!.text!,
        style: textTheme.display3,
      ),
    );
  }

  ExcuseCard.fromExcuse(Excuse excuse)
      : this._(key: ValueKey(excuse.id), excuse: excuse);
}
