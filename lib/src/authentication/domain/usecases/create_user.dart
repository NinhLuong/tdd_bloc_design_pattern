import 'package:tdd_bloc_design_pattern/core/utils/typedef.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/repositories/auth_repo.dart';

class CreateUser {
  final AuthRepo _authRepo;

  const CreateUser(this._authRepo);

  ResultVoidFuture createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async => _authRepo.createUser(
      createdAt: createdAt,
      name: name,
      avatar: avatar,
    );
  }