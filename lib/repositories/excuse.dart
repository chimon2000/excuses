import 'package:excuses/models/models.dart';
import 'package:excuses/services/excuse.dart';
import 'package:remote_state/remote_state.dart';

class ExcuseRepository {
  var excuseService = ExcuseService();

  Future<RemoteState<List<Excuse>>> getExcuses() async {
    try {
      return RemoteState.success(await excuseService.fetchExcuses());
    } catch (e) {
      return RemoteState.error(e);
    }
  }
}
