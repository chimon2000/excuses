import 'package:excuses/logic/logic.dart';
import 'package:excuses/commands/base.command.dart';
import 'package:excuses/models/excuse.dart';
import 'package:excuses/repositories/excuse.dart';
import 'package:remote_state/remote_state.dart';

class GetExcusesCommand extends BaseCommand<RemoteState<List<Excuse>>> {
  @override
  run() async {
    ExcuseRepository excuseRepository = locate();
    HomeLogic homeLogic = locate();

    var excuses = await excuseRepository.getExcuses();
    homeLogic.update(excuses);

    return excuses;
  }
}
