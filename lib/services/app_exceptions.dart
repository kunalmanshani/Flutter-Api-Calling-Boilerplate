class AppExceptions implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  AppExceptions([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message, String? url])
      : super(message, "Bad Request", url);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message, String? url])
      : super(message, "Unable to process", url);
}

class ApiNotResponsingException extends AppExceptions {
  ApiNotResponsingException([String? message, String? url])
      : super(message, "Api Not Responding", url);
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message, String? url])
      : super(message, "UnAuthorized", url);
}
