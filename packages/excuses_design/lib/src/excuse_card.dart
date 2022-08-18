import 'package:flutter/material.dart';

class ExcuseCard extends StatelessWidget {
  const ExcuseCard({Key? key, required this.excuse}) : super(key: key);

  final String excuse;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        excuse,
        style: textTheme.headline2,
      ),
    );
  }
}
