import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const APIException(this.message, this.statusCode);

  @override
  // TODO: implement props
  List<Object?> get props => [message, statusCode];
}