import 'package:get/get.dart';
import 'package:pokemon/core/utils/api_status.dart';

mixin ViewModelStatus {
  var requestStatus = ApiStatus.loading.obs;

  void setStatus(ApiStatus status) => requestStatus.value = status;
}
