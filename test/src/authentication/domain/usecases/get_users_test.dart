import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/entities/user.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/repositories/auth_repo.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/usecases/get_users.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthRepo authRepo;
  late GetUsers getUsers;

  setUp(() {
    authRepo = MockAuthRepo();
    getUsers = GetUsers(authRepo);
  });

  const tResponse = [User.empty()];

  test("should call [AuthRepo.getUsers] and return [List<User>]", () async {
    // arrange
    when(() => authRepo.getUsers()).thenAnswer((_) async => const Right(tResponse));

    // act
    final result = await getUsers();

    // assert
    expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
    verify(() => authRepo.getUsers()).called(1);
    verifyNoMoreInteractions(authRepo);
  });
}