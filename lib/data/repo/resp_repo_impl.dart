import 'package:chat_bot/data/data_source/resp_remote_data_source.dart';
import 'package:chat_bot/domain/entities/app_error.dart';
import 'package:chat_bot/domain/entities/response_entity.dart';
import 'package:chat_bot/domain/repo/resp_repo.dart';
import 'package:dartz/dartz.dart';

class ResponseRepositoryImplementation extends ResponseRepository {
  
  final ResponseRemoteDataSource dataSource;

  ResponseRepositoryImplementation(this.dataSource);
  
  @override
  Future<Either<AppError, ResponseEntity>> getResponse(String msg) async {
    try{
      final resp = await dataSource.getChatResponse(msg);
      return Right(resp);
    } on Exception {
      return Left(AppError('No response currently, please try again later'));
    }
  }
  
}