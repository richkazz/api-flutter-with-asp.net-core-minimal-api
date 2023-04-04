import 'package:equatable/equatable.dart';

import 'error_message.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

// General failures
class ServerFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NetWorkFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureessage;
    case NetWorkFailure:
      return networkFailureMessage;
    default:
      return 'Unexpected error';
  }
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
