import 'package:chat_bot/data/repo/resp_repo_impl.dart';
import 'package:get_it/get_it.dart';
import '../data/core/api_service.dart';
import '../data/data_source/resp_remote_data_source.dart';
import '../domain/repo/resp_repo.dart';
import '../domain/usecases/get_resp.dart';
import '../presentation/cubit/resp_cubit/resp_cubit.dart';

final getItInstance = GetIt.I;

Future<void> init() async {
  getItInstance.registerFactory(
        () => ResponseCubit(response: getItInstance()),
  );

  getItInstance.registerLazySingleton(
        () => GetResponse(getItInstance()),
  );

  getItInstance.registerLazySingleton<ResponseRepository>(
        () => ResponseRepositoryImplementation(getItInstance()),
  );

  getItInstance.registerLazySingleton<ResponseRemoteDataSource>(
        () => ResponseRemoteDataSourceImpl(getItInstance()),
  );

  getItInstance.registerLazySingleton(
        () => ApiService(),
  );
}