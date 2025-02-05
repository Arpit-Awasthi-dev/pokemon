import 'package:get/get.dart';

mixin ViewModelErrors {
  var error = ''.obs;

  void setError(String error) => this.error.value = error;
}
