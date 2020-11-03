import 'package:flutter/foundation.dart';

class NoInternetException {
  final String message;

  const NoInternetException({@required this.message});
}

class UnAunthicatedException {
  final String message;
  const UnAunthicatedException({@required this.message});
}

class ServerSideException {
  final String message;
  const ServerSideException({@required this.message});
}

class NoDataException {
  final String message;
  const NoDataException({@required this.message});
}

class UnknownException {
  final String message;
  const UnknownException({@required this.message});
}

class Exception404 {
  final String message;
  const Exception404({@required this.message});
}

class ConnectionTimeOutException {
  final String message;
  const ConnectionTimeOutException({@required this.message});
}

class WrongInputException {
  final String message;
  const WrongInputException({@required this.message});
}

class ApiException {
  final String message;
  const ApiException({@required this.message});
}
