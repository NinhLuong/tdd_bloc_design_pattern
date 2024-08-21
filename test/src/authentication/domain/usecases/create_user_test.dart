import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/repositories/auth_repo.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/usecases/create_user.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late CreateUser usecase;
  late AuthRepo mockAuthRepo;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    usecase = CreateUser(mockAuthRepo);
  });

  test('should create user', () async {
    // arrange
    const params = CreateUserParams(
      createdAt: '2022-01-01',
      name: 'John Doe',
      avatar: 'https://example.com/avatar.jpg',
    );

    // act
    await usecase(params);

    // assert
    verify(() => mockAuthRepo.createUser(
      createdAt: params.createdAt,
      name: params.name,
      avatar: params.avatar,
    )).called(1);
  });

}