import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StateListener<T> extends StatelessWidget {
  const StateListener({
    Key? key,
    required this.onStateChanged,
    required this.child,
  }) : super(key: key);

  final OnStateChanged<T> onStateChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final T value = context.watch();

    return _ValueListener(
      value: value,
      onValueChanged: onStateChanged,
      child: child,
    );
  }
}

/// A widget that watches a value and calls a function when it changed.
class _ValueListener<T> extends StatefulWidget {
  /// Creates a [ValueListener].
  ///
  /// The parameters [onValueChanged] and [child] must not be null.
  const _ValueListener({
    Key? key,
    required this.value,
    required this.onValueChanged,
    required this.child,
  }) : super(key: key);

  /// The value to listen to changes.
  final T value;

  /// The function called when the [value] changed.
  final OnStateChanged<T> onValueChanged;

  /// The widget below in the tree.
  ///
  /// {@macro flutter.widgets.child}.
  final Widget child;

  @override
  _ValueListenerState<T> createState() => _ValueListenerState<T>();
}

class _ValueListenerState<T> extends State<_ValueListener<T>> {
  @override
  void didUpdateWidget(_ValueListener<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_equalityComparer(oldWidget.value, widget.value)) {
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) => widget.onValueChanged(context, widget.value),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

typedef OnStateChanged<T> = void Function(BuildContext context, T state);
typedef EqualityComparer<T> = bool Function(T a, T b);

bool _equalityComparer<T>(T previous, T current) => previous == current;
