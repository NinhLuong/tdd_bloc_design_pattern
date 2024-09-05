import 'package:equatable/equatable.dart';
import 'package:tdd_bloc_design_pattern/core/usecase/usecase.dart';
import 'package:tdd_bloc_design_pattern/core/utils/typedef.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/repositories/auth_repo.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  final AuthRepo _authRepo;

  CreateUser(this._authRepo);

  @override
  ResultVoidFuture call(CreateUserParams params) async => _authRepo.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams.empty()
      : this(
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
