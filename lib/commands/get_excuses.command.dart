import 'package:excuses/blocs/home.dart';
import 'package:excuses/commands/base.command.dart';
import 'package:excuses/models/excuse.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:remote_state/remote_state.dart';

class GetExcusesCommand extends BaseCommand<RemoteState<List<Excuse>>> {
  @override
  run() async {
    ExcuseRepository excuseRepository = locate();
    HomeCubit homeBloc = locate();

    var excuses = await excuseRepository.getExcuses();
    homeBloc.update(excuses);

    return excuses;
  }
}
