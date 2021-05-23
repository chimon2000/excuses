import 'dart:async';

import 'package:excuses/models/excuse.dart';
import 'package:excuses/models/models.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:remote_state/remote_state.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeLogic extends StateNotifier<HomeState> {
  var excuseRepository = ExcuseRepository();

  HomeLogic() : super(RemoteState.initial());

  Future<void> getExcuses() async {
    state = RemoteState.loading();

    state = await excuseRepository.getExcuses();
  }
}

typedef HomeState = RemoteState<List<Excuse>>;
