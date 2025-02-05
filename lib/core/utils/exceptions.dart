import 'package:pokemon/localization/locale_keys.dart';

class CustomExceptions implements Exception {
  final String message;

  CustomExceptions(this.message);
}

class InternetException extends CustomExceptions {
  InternetException() : super(Localized.exceptionInternet);
}

class RequestTimeoutException extends CustomExceptions {
  RequestTimeoutException() : super(Localized.exceptionTimeout);
}

class ServerExceptions extends CustomExceptions {
  ServerExceptions() : super(Localized.exceptionServer);
}
