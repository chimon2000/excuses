import 'dart:async';

import 'package:excuses/models/excuse.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class HomeViewmodel {
  var excuseRepository = ExcuseRepository();

  StreamSubscription<void> getExcuses() {
    var obs = excuseRepository.getExcuses().listen((data) {
      _excusesStream$.add(data);
    });

    return obs;
  }

  final _excusesStream$ = _createStateStream<List<Excuse>>();

  ValueStream<RemoteState<List<Excuse>>> get excusesStream$ =>
      _excusesStream$.stream;
}

BehaviorSubject<RemoteState<T>> _createStateStream<T>() {
  return BehaviorSubject<RemoteState<T>>();
}
