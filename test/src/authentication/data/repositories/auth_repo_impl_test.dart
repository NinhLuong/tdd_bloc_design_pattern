import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_bloc_design_pattern/core/errors/exceptions.dart';
import 'package:tdd_bloc_design_pattern/core/errors/failure.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/data/datasouces/auth_remote_data_source.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/data/repositories/auth_repo_impl.dart';

class MockAuthRemoteDataSrc extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRemoteDataSource remoteDataSource;
  late AuthRepoImpl authRepoImpl;

  const tException = APIException("Unknown Error Occurred", 500);

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    authRepoImpl = AuthRepoImpl(remoteDataSource);
  });

  group("creatUser", () {
    const createdAt = "whatever.createdAt";
    const name = "whatever.name";
    const avatar = "whatever.avatar";

    test("show call AuthRemoteDataSource.creatUser ", () async {
      // arrange
      when(() => remoteDataSource.createUser(
          createdAt: any(named: "createdAt"),
          name: any(named: "name"),
          avatar: any(named: "avatar"))).thenAnswer((_) async => Future.value());

      // act
      final result = await authRepoImpl.createUser(createdAt: createdAt, name: name, avatar: avatar);

      // assert
      expect(result, equals(const Right(null)));
      verify(() => remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test("should return a [ServerFailure] when the call to the remote data source is unsuccessful", () async {
      // arrange
      when(() => remoteDataSource.createUser(
          createdAt: any(named: "createdAt"),
          name: any(named: "name"),
          avatar: any(named: "avatar"))).thenThrow(tException);

      // act
      final result = await authRepoImpl.createUser(createdAt: createdAt, name: name, avatar: avatar);

      // assert
      expect(result, equals(Left(APIFailure(message: tException.message , statusCode: tException.statusCode))));
      verify(() => remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group("getUsers", () {
    test("show call AuthRemoteDataSource.getUsers ", () async {
      // arrange
      when(() => remoteDataSource.getUsers()).thenAnswer((_) async => Future.value([]));

      // act
      final result = await authRepoImpl.getUsers();

      // assert
      expect(result, equals(const Right([])));
      verify(() => remoteDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
