import 'package:excuses/models/models.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:remote_state/remote_state.dart';

class HomeLogic extends ValueNotifier<HomeState> {
  var excuseRepository = ExcuseRepository();

  HomeLogic() : super(RemoteState.loading());

  void update(RemoteState<List<Excuse>> excuses) => value = excuses;
}

typedef HomeState = RemoteState<List<Excuse>>;
