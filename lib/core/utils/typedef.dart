import 'package:dartz/dartz.dart';
import 'package:tdd_bloc_design_pattern/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoidFuture = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;