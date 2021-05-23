import 'package:excuses/models/models.dart';
import 'package:excuses/services/excuse.dart';
import 'package:remote_state/remote_state.dart';
import 'package:rxdart/rxdart.dart';

class ExcuseRepository {
  var excuseService = ExcuseService();

  Stream<RemoteState<List<Excuse>>> getExcuses() {
    return excuseService
        .fetchExcuses()
        .asStream()
        .shareReplay(maxSize: 1)
        .map(_mapSuccess)
        .startWith(RemoteState.loading());
  }

  RemoteState<List<Excuse>> _mapSuccess(List<Excuse> data) {
    return RemoteState.success(data);
  }
}
