import 'package:docdoc2/core/networking/api_error_handler.dart';
import 'package:docdoc2/core/networking/api_result.dart';
import 'package:docdoc2/core/networking/api_service.dart';
import 'package:docdoc2/features/login/data/models/login_request_body.dart';
import 'package:docdoc2/features/login/data/models/login_response.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponse>> login(
      {required LoginRequestBody loginRequestBody});
}

class LoginRepoImpl extends LoginRepo {
  final ApiService _apiService;

  LoginRepoImpl(this._apiService);

  @override
  Future<ApiResult<LoginResponse>> login(
      {required LoginRequestBody loginRequestBody}) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
