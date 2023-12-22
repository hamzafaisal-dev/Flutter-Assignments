import 'package:bloc_class/models/product_model.dart';
import 'package:bloc_class/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState([List props = const []]) : super();
}

class UserEmpty extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UserLoaded extends UserState {
  final List<User> user;

  UserLoaded({required this.user}) : super([user]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UserError extends UserState {
  final String? errorMsg;
  UserError({this.errorMsg});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
