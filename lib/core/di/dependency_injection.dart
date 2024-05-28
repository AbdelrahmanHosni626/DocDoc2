import 'package:dio/dio.dart';
import 'package:docdoc2/core/networking/api_service.dart';
import 'package:docdoc2/core/networking/dio_factory.dart';
import 'package:docdoc2/features/login/data/repos/login_repo.dart';
import 'package:docdoc2/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc2/features/register/data/repos/register_repo.dart';
import 'package:docdoc2/features/register/logic/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio and Api Service

  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  
  
  //Login
  getIt.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  //Register
  getIt.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
}
