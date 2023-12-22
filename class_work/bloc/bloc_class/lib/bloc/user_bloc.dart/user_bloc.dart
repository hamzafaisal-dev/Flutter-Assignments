import 'package:bloc_class/bloc/user_bloc.dart/user_event.dart';
import 'package:bloc_class/bloc/user_bloc.dart/user_states.dart';
import 'package:bloc_class/core/repository/product_repo.dart';
import 'package:bloc_class/core/repository/user_repo.dart';
import 'package:bloc_class/models/product_model.dart';
import 'package:bloc_class/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserLoading()) {
    //
    on<FetchUser>((event, emit) async {
      await _getUser(emit);
    });

    // on<FetchUserMoc>((event, emit) async {
    //   await _getUserMoc(emit);
    // });
  }

  Future<void> _getUser(Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final List<User> user = await userRepository.getUserMoc();
      emit(UserLoaded(user: user));
    } catch (e) {
      emit(UserError(errorMsg: e.toString()));
    }
  }

  // Future<void> _getUserMoc(Emitter<UserState> emit) async {
  //   emit(UserLoading());
  //   try {
  //     final List<User> user = await productRepository.getUserMoc();
  //     emit(UserLoaded(user: user));
  //   } catch (e) {
  //     emit(UserError(errorMsg: e.toString()));
  //   }
  // }
}
