import '../core/api_service.dart';
import '../model/response_model.dart';

abstract class ResponseRemoteDataSource {
  Future<ResponseModel> getChatResponse(String message);
}

class ResponseRemoteDataSourceImpl extends ResponseRemoteDataSource {
  final ApiService _apiService;

  ResponseRemoteDataSourceImpl(this._apiService);

  @override
  Future<ResponseModel> getChatResponse(String message) async {
    final response = await _apiService.getData(message);
    return ResponseModel.fromJson(response);
  }
}