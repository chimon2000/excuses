import 'package:excuses_riverpod/ui/app_providers.dart';
import 'package:excuses_data/excuses_data.dart';
import 'package:riverpod/riverpod.dart';

class FavoritesLogicController {
  FavoritesLogicController(this.ref);

  final Ref ref;

  Future<void> toggleFavorite(int id) async {
    await ref.read(excusesFacadeProvider).toggleFavorite(id);
    await ref.refresh(favoritesProvider.future);
  }
}

final favoritesLogicControllerProvider =
    Provider<FavoritesLogicController>((ref) {
  return FavoritesLogicController(ref);
});

final favoritesProvider = FutureProvider<List<Excuse>>((ref) {
  /// Nothing implemented
  return [];
});
