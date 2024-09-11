import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_bloc_design_pattern/core/utils/typedef.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/data/models/user_model.dart';
import 'package:tdd_bloc_design_pattern/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();

  test("Should be a subclass of [User] entity", () {
    // arrange

    // act

    // assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture("user.json");
  final tMap = jsonDecode(tJson) as DataMap;

  group("fromMap", (){
    test("Should return a valid model", () {
      // act
      final result = UserModel.fromMap(tMap);

      // assert
      expect(result, equals(tModel));
    });
    // assert
  }
  );

  group("toMap", (){
    test("Should return a JSON map containing the proper data", () {
      // act
      final result = tModel.toMap();

      // assert
      expect(result, equals(tMap));
    });
  });

  group("fromJson", (){
    test("Should return a valid model", () {
      // act
      final result = UserModel.fromJson(tJson);

      // assert
      expect(result, equals(tModel));
    });
  });

  group("toJson", (){
    test("Should return a JSON string containing the proper data", () {
      // act
      final result = tModel.toJson();
      final tJson = jsonEncode(  {
        "id": "1",
        "createdAt": "_empty.createdAt",
        "name": "_empty.name",
        "avatar": "_empty.avatar"
      });

      // assert
      expect(result, equals(tJson));
    });
  });

  group("copyWith", (){
    test("Should return a copy of the model", () {
      // act
      final result = tModel.copyWith();

      // assert
      expect(result, equals(tModel));
    });
  });
}