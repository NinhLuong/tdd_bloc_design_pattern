import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/data/models/user_model.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/entities/user.dart';

void main() {
  const tModel = UserModel.empty();

  test("Should be a subclass of [User] entity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<User>());
  });

  group("fromMap", (){
    // arrange
    final toJson = File("test/fixtures/user.json").readAsStringSync();
    // act
    final result = UserModel.fromMap(map);
    // assert
  }
  );
}