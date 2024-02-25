// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String message;
  final String exception;

  const CustomError({
    this.code = '',
    this.message = '',
    this.exception = '',
  });

  @override
  String toString() =>
      'CustomError(code: $code, message: $message, exception: $exception)';

  @override
  List<Object> get props => [code, message, exception];
}
