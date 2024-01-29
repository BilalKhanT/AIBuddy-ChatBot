import 'package:chat_bot/domain/entities/resp_params.dart';
import 'package:chat_bot/domain/entities/response_entity.dart';
import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';
import '../repo/resp_repo.dart';

class GetResponse {
final ResponseRepository repo;

GetResponse(this.repo);

Future<Either<AppError, ResponseEntity>> call(ResponseParams params) async {
  return await repo.getResponse(params.text);
}
}