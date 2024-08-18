import 'package:tdd_bloc_design_pattern/core/usecase/usecase.dart';
import 'package:tdd_bloc_design_pattern/core/utils/typedef.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/entities/user.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/repositories/auth_repo.dart';

class GetUsers extends UsecaseWithoutParams<List<User>>{
  final AuthRepo _authRepo;

  GetUsers(this._authRepo);

  @override
  ResultFuture<List<User>> call() async => _authRepo.getUsers();
}
