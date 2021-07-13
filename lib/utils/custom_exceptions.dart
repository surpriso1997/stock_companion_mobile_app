import 'package:flutter/foundation.dart';

class CustomApiExcception {
  final String message;

  const CustomApiExcception({required this.message});
}

class NoInternetException extends CustomApiExcception {
  final String message;

  const NoInternetException({@required required this.message})
      : super(message: message);
}

class UnAunthicatedException extends CustomApiExcception {
  final String message;
  const UnAunthicatedException({@required required this.message})
      : super(message: message);
}

class ServerSideException extends CustomApiExcception {
  final String message;
  const ServerSideException({@required required this.message})
      : super(message: message);
}

class NoDataException extends CustomApiExcception {
  final String message;
  const NoDataException({@required required this.message})
      : super(message: message);
}

class UnknownException extends CustomApiExcception {
  final String message;
  const UnknownException({@required required this.message})
      : super(message: message);
}

class Exception404 extends CustomApiExcception {
  final String message;
  const Exception404({@required required this.message})
      : super(message: message);
}

class ConnectionTimeOutException extends CustomApiExcception {
  final String message;
  const ConnectionTimeOutException({@required required this.message})
      : super(message: message);
}

class WrongInputException extends CustomApiExcception {
  final String message;
  const WrongInputException({@required required this.message})
      : super(message: message);
}

class ApiException extends CustomApiExcception {
  final String message;
  const ApiException({@required required this.message})
      : super(message: message);
}

class MarketClosedException {}
