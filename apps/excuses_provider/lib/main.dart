import 'package:excuses_data/excuses_data.dart';
import 'package:excuses_provider/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [Provider.value(value: ExcuseFacade())],
        child: const ExcusesApp(),
      ),
    );
