// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'remote_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RemoteStateTearOff {
  const _$RemoteStateTearOff();

  Success<T> success<T>(T value) {
    return Success<T>(
      value,
    );
  }

  Loading<T> loading<T>() {
    return Loading<T>();
  }

  Empty<T> empty<T>() {
    return Empty<T>();
  }

  ErrorDetails<T> error<T>([String message]) {
    return ErrorDetails<T>(
      message,
    );
  }
}

// ignore: unused_element
const $RemoteState = _$RemoteStateTearOff();

mixin _$RemoteState<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T value),
    @required Result loading(),
    @required Result empty(),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T value),
    Result loading(),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result loading(Loading<T> value),
    @required Result empty(Empty<T> value),
    @required Result error(ErrorDetails<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result loading(Loading<T> value),
    Result empty(Empty<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  });
}

abstract class $RemoteStateCopyWith<T, $Res> {
  factory $RemoteStateCopyWith(
          RemoteState<T> value, $Res Function(RemoteState<T>) then) =
      _$RemoteStateCopyWithImpl<T, $Res>;
}

class _$RemoteStateCopyWithImpl<T, $Res>
    implements $RemoteStateCopyWith<T, $Res> {
  _$RemoteStateCopyWithImpl(this._value, this._then);

  final RemoteState<T> _value;
  // ignore: unused_field
  final $Res Function(RemoteState<T>) _then;
}

abstract class $SuccessCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) then) =
      _$SuccessCopyWithImpl<T, $Res>;
  $Res call({T value});
}

class _$SuccessCopyWithImpl<T, $Res> extends _$RemoteStateCopyWithImpl<T, $Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(Success<T> _value, $Res Function(Success<T>) _then)
      : super(_value, (v) => _then(v as Success<T>));

  @override
  Success<T> get _value => super._value as Success<T>;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(Success<T>(
      value == freezed ? _value.value : value as T,
    ));
  }
}

class _$Success<T> implements Success<T> {
  const _$Success(this.value) : assert(value != null);

  @override
  final T value;

  @override
  String toString() {
    return 'RemoteState<$T>.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T value),
    @required Result loading(),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(success != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return success(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T value),
    Result loading(),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result loading(Loading<T> value),
    @required Result empty(Empty<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert(success != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result loading(Loading<T> value),
    Result empty(Empty<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements RemoteState<T> {
  const factory Success(T value) = _$Success<T>;

  T get value;
  $SuccessCopyWith<T, Success<T>> get copyWith;
}

abstract class $LoadingCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) then) =
      _$LoadingCopyWithImpl<T, $Res>;
}

class _$LoadingCopyWithImpl<T, $Res> extends _$RemoteStateCopyWithImpl<T, $Res>
    implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(Loading<T> _value, $Res Function(Loading<T>) _then)
      : super(_value, (v) => _then(v as Loading<T>));

  @override
  Loading<T> get _value => super._value as Loading<T>;
}

class _$Loading<T> implements Loading<T> {
  const _$Loading();

  @override
  String toString() {
    return 'RemoteState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T value),
    @required Result loading(),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(success != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T value),
    Result loading(),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result loading(Loading<T> value),
    @required Result empty(Empty<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert(success != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result loading(Loading<T> value),
    Result empty(Empty<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements RemoteState<T> {
  const factory Loading() = _$Loading<T>;
}

abstract class $EmptyCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
}

class _$EmptyCopyWithImpl<T, $Res> extends _$RemoteStateCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;
}

class _$Empty<T> implements Empty<T> {
  const _$Empty();

  @override
  String toString() {
    return 'RemoteState<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T value),
    @required Result loading(),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(success != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T value),
    Result loading(),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result loading(Loading<T> value),
    @required Result empty(Empty<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert(success != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result loading(Loading<T> value),
    Result empty(Empty<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements RemoteState<T> {
  const factory Empty() = _$Empty<T>;
}

abstract class $ErrorDetailsCopyWith<T, $Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails<T> value, $Res Function(ErrorDetails<T>) then) =
      _$ErrorDetailsCopyWithImpl<T, $Res>;
  $Res call({String message});
}

class _$ErrorDetailsCopyWithImpl<T, $Res>
    extends _$RemoteStateCopyWithImpl<T, $Res>
    implements $ErrorDetailsCopyWith<T, $Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails<T> _value, $Res Function(ErrorDetails<T>) _then)
      : super(_value, (v) => _then(v as ErrorDetails<T>));

  @override
  ErrorDetails<T> get _value => super._value as ErrorDetails<T>;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ErrorDetails<T>(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$ErrorDetails<T> implements ErrorDetails<T> {
  const _$ErrorDetails([this.message]);

  @override
  final String message;

  @override
  String toString() {
    return 'RemoteState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails<T> &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ErrorDetailsCopyWith<T, ErrorDetails<T>> get copyWith =>
      _$ErrorDetailsCopyWithImpl<T, ErrorDetails<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result success(T value),
    @required Result loading(),
    @required Result empty(),
    @required Result error(String message),
  }) {
    assert(success != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(T value),
    Result loading(),
    Result empty(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result loading(Loading<T> value),
    @required Result empty(Empty<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert(success != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result loading(Loading<T> value),
    Result empty(Empty<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails<T> implements RemoteState<T> {
  const factory ErrorDetails([String message]) = _$ErrorDetails<T>;

  String get message;
  $ErrorDetailsCopyWith<T, ErrorDetails<T>> get copyWith;
}
