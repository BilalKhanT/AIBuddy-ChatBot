import 'package:chat_bot/domain/entities/response_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ResponseState extends Equatable {
  const ResponseState();

  @override
  List<Object> get props => [];
}

class ResponseInitial extends ResponseState {}

class ResponseLoading extends ResponseState {}

class ResponseLoaded extends ResponseState {
  final String response;

  ResponseLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class ResponseError extends ResponseState {
  final String message;

  ResponseError(this.message);

  @override
  List<Object> get props => [message];
}
