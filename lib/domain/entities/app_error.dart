import 'package:equatable/equatable.dart';

class AppError extends Equatable{
  final String errorMsg;

  AppError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}