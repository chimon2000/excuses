import 'package:excuses/models/models.dart';
import 'package:excuses/services/excuse.dart';
import 'package:rxdart/rxdart.dart';

class ExcuseRepository {
  var excuseService = ExcuseService();

  Stream<RemoteState<List<Excuse>>> getExcuses() {
    return excuseService
        .fetchExcuses()
        .asStream()
        .shareReplay(maxSize: 1)
        .map(_mapSuccess)
        .onErrorReturnWith(_mapError)
        .startWith(RemoteState.loading());
  }

  RemoteState<List<Excuse>> _mapSuccess(List<Excuse> data) {
    return data.isEmpty ? RemoteState.empty() : RemoteState.success(data);
  }

  RemoteState<T> _mapError<T>(error) {
    return RemoteState.error();
  }
}
