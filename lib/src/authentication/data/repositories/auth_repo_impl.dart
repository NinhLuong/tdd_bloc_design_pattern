import 'package:dartz/dartz.dart';
import 'package:tdd_bloc_design_pattern/core/errors/exceptions.dart';
import 'package:tdd_bloc_design_pattern/core/errors/failure.dart';
import 'package:tdd_bloc_design_pattern/core/utils/typedef.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/data/datasouces/auth_remote_data_source.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/entities/user.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  ResultVoidFuture createUser({required String createdAt, required String name, required String avatar}) async {
    try{
      await _remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure(message: e.message, statusCode: e.statusCode));
    }

  }

  @override
  ResultFuture<List<User>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
