import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent([List props = const []]) : super();
}

class FetchUser extends UserEvent {
  const FetchUser() : super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchUserMoc extends UserEvent {
  const FetchUserMoc() : super();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
