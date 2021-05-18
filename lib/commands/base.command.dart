import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

abstract class BaseCommand<T> {
  D locate<D extends Object>() => getIt.get<D>();

  Future<T> run();
  Future<T> undo() => notImplemented();
  Future<T> redo() => notImplemented();

  Future<T> notImplemented() {
    print("Cannot undo a $runtimeType operation");

    return Future.value();
  }
}
