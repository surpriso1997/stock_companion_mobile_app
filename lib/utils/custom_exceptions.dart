import 'package:flutter/foundation.dart';

class CustomApiExcception {
  final String message;

  const CustomApiExcception({this.message});
}

class NoInternetException extends CustomApiExcception {
  final String message;

  const NoInternetException({@required this.message}) : super(message: message);
}

class UnAunthicatedException extends CustomApiExcception {
  final String message;
  const UnAunthicatedException({@required this.message})
      : super(message: message);
}

class ServerSideException extends CustomApiExcception {
  final String message;
  const ServerSideException({@required this.message}) : super(message: message);
}

class NoDataException extends CustomApiExcception {
  final String message;
  const NoDataException({@required this.message}) : super(message: message);
}

class UnknownException extends CustomApiExcception {
  final String message;
  const UnknownException({@required this.message}) : super(message: message);
}

class Exception404 extends CustomApiExcception {
  final String message;
  const Exception404({@required this.message}) : super(message: message);
}

class ConnectionTimeOutException extends CustomApiExcception {
  final String message;
  const ConnectionTimeOutException({@required this.message})
      : super(message: message);
}

class WrongInputException extends CustomApiExcception {
  final String message;
  const WrongInputException({@required this.message}) : super(message: message);
}

class ApiException extends CustomApiExcception {
  final String message;
  const ApiException({@required this.message}) : super(message: message);
}
