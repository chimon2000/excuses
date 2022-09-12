import 'dart:async';

import 'package:riverpod/riverpod.dart';

class MutationNotifier extends StateNotifier<AsyncValue> {
  MutationNotifier() : super(const AsyncValue.data(null));

  Future<void> mutate(FutureOr<void> Function() mutationFn) async {
    state = const AsyncValue<void>.loading();
    state = await AsyncValue.guard(() async => mutationFn());
  }
}

final mutationProvider =
    StateNotifierProvider.family<MutationNotifier, AsyncValue, String>((
  ref,
  key,
) {
  return MutationNotifier();
});
