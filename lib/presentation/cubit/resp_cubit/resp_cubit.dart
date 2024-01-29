import 'package:chat_bot/domain/entities/resp_params.dart';
import 'package:chat_bot/presentation/cubit/resp_cubit/resp_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/response_entity.dart';
import '../../../domain/usecases/get_resp.dart';

class ResponseCubit extends Cubit<ResponseState> {
  final GetResponse response;

  ResponseCubit({required this.response}) : super(ResponseInitial());

  sendMessage(String msg) async {
    emit(ResponseLoading());
    final Either<AppError, ResponseEntity> result =
    await response(ResponseParams(msg));

    result.fold(
          (error) => emit(ResponseError(error.errorMsg)),
          (response) => emit(ResponseLoaded(response.text)),
    );
  }
}
