import 'package:pokemon/core/utils/api_status.dart';

class ApiResponse<T> {
  ApiStatus status;
  T? data;

  ApiResponse(this.data, this.status);

  ApiResponse.loading() : status = ApiStatus.loading;

  ApiResponse.success() : status = ApiStatus.success;

  ApiResponse.error() : status = ApiStatus.error;
}
