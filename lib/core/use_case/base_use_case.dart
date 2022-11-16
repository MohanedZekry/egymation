import 'package:dartz/dartz.dart';
import 'package:egymation/core/error/failure.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, P> {
  Future<Either<Failure,T>> call(P params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}