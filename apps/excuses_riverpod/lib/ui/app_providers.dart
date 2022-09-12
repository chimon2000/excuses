import 'package:excuses_data/excuses_data.dart';
import 'package:riverpod/riverpod.dart';

final excusesProvider = FutureProvider<List<Excuse>>((ref) async {
  final excusesFacade = ref.read(excusesFacadeProvider);
  return await excusesFacade.fetchExcuses();
});

final excusesFacadeProvider = Provider<ExcuseFacade>((ref) {
  return ExcuseFacade();
});
