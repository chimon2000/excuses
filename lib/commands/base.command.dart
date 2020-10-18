import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class BaseCommand<T> {
  BuildContext _context;

  BaseCommand(BuildContext context) {
    /// Get root context
    /// If we're passed a context that is known to be root, skip the lookup, it will throw an error otherwise.
    _context = (context == _lastKnownRoot) ? context : context.read();
    _lastKnownRoot = _context;
  }

  D locate<D>() => _context.read();

  static BuildContext _lastKnownRoot;

  Future<T> run();
  Future<T> undo() => notImplemented();
  Future<T> redo() => notImplemented();

  Future<T> notImplemented() {
    print("Cannot undo a $runtimeType operation");

    return Future.value();
  }
}
