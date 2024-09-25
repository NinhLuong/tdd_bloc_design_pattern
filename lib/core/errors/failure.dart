import 'package:equatable/equatable.dart';
import 'package:tdd_bloc_design_pattern/core/errors/exceptions.dart';

abstract class Failure extends Equatable{
  final String message;
  final int statusCode;

  const Failure({required this.message, required this.statusCode});

  @override
  List<Object> get props {
    return [message, statusCode];
  }
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});

  APIFailure.fromException({required APIException exception})
      : super(message: exception.message, statusCode: exception.statusCode);
}