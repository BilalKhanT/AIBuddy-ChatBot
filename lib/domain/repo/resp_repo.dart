import 'package:chat_bot/domain/entities/response_entity.dart';
import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';

abstract class ResponseRepository {
  Future<Either<AppError, ResponseEntity>> getResponse(String msg);
}