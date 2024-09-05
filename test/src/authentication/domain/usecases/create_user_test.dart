import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/repositories/auth_repo.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/usecases/create_user.dart';

import 'auth_repo.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthRepo mockAuthRepo;
  const params = CreateUserParams.empty();

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    usecase = CreateUser(mockAuthRepo);
  });

  test('should create user', () async {
    // arrange
    when(() => mockAuthRepo.createUser(
        createdAt: any(named: "createdAt"),
        name: any(named: "name"),
        avatar: any(named: "avatar"))).thenAnswer((_) async => const Right(null));

    // act
    final result = await usecase(params);

    // assert
    expect(result, equals(const Right<dynamic, void>(null)));

    verify(() => mockAuthRepo.createUser(createdAt: params.createdAt, name: params.name, avatar: params.avatar))
        .called(1);

    verifyNoMoreInteractions(mockAuthRepo);
  });
}
