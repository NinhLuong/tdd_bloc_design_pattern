import 'package:tdd_bloc_design_pattern/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  ResultFuture<Type> call();
}