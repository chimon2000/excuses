import 'package:excuses_riverpod/ui/common/mutation_provider.dart';
import 'package:excuses_riverpod/ui/controllers/favorites_logic_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteIconButton extends ConsumerWidget {
  const FavoriteIconButton({
    Key? key,
    required this.id,
    required this.isFavorite,
  }) : super(key: key);

  final int id;
  final bool isFavorite;

  @override
  Widget build(BuildContext context, ref) {
    final mutation = ref.watch(mutationProvider('toggleFavorite'));
    final icon = isFavorite ? Icons.bookmark : Icons.bookmark_outline;
    final handlePressed = mutation.isLoading
        ? null
        : () {
            final mutation =
                ref.read(mutationProvider('toggleFavorite').notifier);
            mutation.mutate(() =>
                ref.read(favoritesLogicControllerProvider).toggleFavorite(id));
          };

    return IconButton(
      icon: Icon(icon),
      onPressed: handlePressed,
    );
  }
}
