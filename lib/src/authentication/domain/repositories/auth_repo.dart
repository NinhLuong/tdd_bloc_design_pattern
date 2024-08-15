import 'package:tdd_bloc_design_pattern/core/utils/typedef.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/entities/user.dart';

abstract class AuthRepo{
  const AuthRepo();

  ResultVoidFuture createUser({
    required String createdAt,
    required String name,
    required String avatar,
});

  ResultFuture<List<User>> getUsers();
}