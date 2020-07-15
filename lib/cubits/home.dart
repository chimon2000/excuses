import 'package:bloc/bloc.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:remote_state/remote_state.dart';

class HomeCubit extends Cubit<RemoteState<List<Excuse>>> {
  var excuseRepository = ExcuseRepository();

  HomeCubit() : super(RemoteState.loading()) {
    getExcuses();
  }

  Future<void> getExcuses() async {
    var excuses = await excuseRepository.getExcuses();

    emit(excuses);
  }
}
