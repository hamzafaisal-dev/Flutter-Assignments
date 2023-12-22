import 'package:bloc/bloc.dart';
import 'package:final_exam/core/auth/auth_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;

  SignUpBloc({required this.authRepository}) : super(SignUpInitialState()) {
    on<SignUpSubmittedEvent>((event, emit) async {
      //
      await _signUpWithMailAndPass(
        event.name,
        event.email,
        event.password,
        emit,
      );
    });
  }

  Future<void> _signUpWithMailAndPass(
      String name, String email, String password, Emitter emit) async {
    //
    try {
      emit(SignUpLoadingState());

      await authRepository.handleSignUp(name, email, password);

      emit(SignUpValidState());
    } catch (error) {
      emit(SignUpErrorState(error.toString()));
    }
  }
}
