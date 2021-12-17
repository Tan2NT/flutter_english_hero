class AppException implements Exception {
  final String _message;
  String _prefix;

  AppException(this._message, [this._prefix = '']);

  String toExceptionString() {
    return "$_prefix: $_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, "Error During Communication");
}

class BadRequestException extends AppException {
  BadRequestException(message) : super(message, "Invalid Request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(message) : super(message, "Unauthorised");
}

class InvalidInputException extends AppException {
  InvalidInputException(String message) : super(message, "Invalid Input");
}

class UnknowErrorException extends AppException {
  UnknowErrorException(String message) : super(message, "Unknow Error");
}
