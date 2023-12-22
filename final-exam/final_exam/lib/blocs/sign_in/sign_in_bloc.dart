import 'package:bloc/bloc.dart';
import 'package:final_exam/core/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;

  SignInBloc({required this.authRepository}) : super(SignInInitialState()) {
    on<SignInSubmittedEvent>((event, emit) async {
      await _signInWithMailAndPass(emit, event.email, event.password);
    });
  }

  Future<void> _signInWithMailAndPass(
    Emitter<SignInState> emit,
    String email,
    String password,
  ) async {
    emit(SignInLoadingState());
    try {
      // get user credential from login operation
      UserCredential authenticatedUser =
          await authRepository.handleLogin(email, password);

      // if user null, emit error
      if (authenticatedUser.user == null) {
        emit(SignInInErrorState('User does not exist'));
      }

      // else emit valid login state
      emit(
        SignInValidState(authenticatedUser.user!),
      );
    } catch (e) {
      emit(SignInInErrorState(e.toString()));
    }
  }
}
