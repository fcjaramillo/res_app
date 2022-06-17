import 'package:equatable/equatable.dart';

abstract class Result<T, E> {
  Result();

  E? get failRes;

  T? get successRes;

  factory Result.fail(E e) = Fail;

  factory Result.success(T t) = Success;

  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  });
}

class Success<T, E> extends Result<T, E> {
  final T _success;

  Success(T success) : _success = success;

  @override
  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  }) =>
      success(_success);

  @override
  E? get failRes => null;

  @override
  T get successRes => _success;
}

/// Fail result implementation class
class Fail<T, E> extends Result<T, E> {
  final E _fail;

  Fail(E e) : _fail = e;

  @override
  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  }) =>
      fail(_fail);

  @override
  E? get failRes => _fail;

  @override
  T? get successRes => null;
}

class BackError extends Equatable{
  final String? description;
  final String? err;
  final Map? data;
  final int statusCode;

  const BackError({
    this.data,
    this.description,
    this.err,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [
        data,
        description,
        err,
        statusCode,
      ];
}
