import 'package:docdoc2/core/networking/api_error_handler.dart';
import 'package:docdoc2/core/networking/api_result.dart';
import 'package:docdoc2/core/networking/api_service.dart';
import 'package:docdoc2/features/register/data/models/register_request_body.dart';
import 'package:docdoc2/features/register/data/models/register_response.dart';

abstract class RegisterRepo {
  Future<ApiResult<RegisterResponse>> register(
      {required RegisterRequestBody registerRequestBody});
}

class RegisterRepoImpl extends RegisterRepo {
  final ApiService _apiService;

  RegisterRepoImpl(this._apiService);

  @override
  Future<ApiResult<RegisterResponse>> register(
      {required RegisterRequestBody registerRequestBody}) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
