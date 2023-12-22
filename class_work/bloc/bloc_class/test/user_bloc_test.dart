import 'dart:io';

import 'package:bloc_class/bloc/user_bloc.dart/user_bloc.dart';
import 'package:bloc_class/bloc/user_bloc.dart/user_event.dart';
import 'package:bloc_class/bloc/user_bloc.dart/user_states.dart';
import 'package:bloc_class/core/repository/network.dart';
import 'package:bloc_class/core/repository/user_repo.dart';
import 'package:bloc_class/models/user_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  late UserBloc userBloc;
  late UserRepository userRepo;

  setUpAll(() {
    userRepo = UserRepository(
      userApiClient: UserApiClient(
        httpClient: http.Client(),
      ),
    );

    userBloc = UserBloc(userRepository: userRepo);
  });

  group('group name', () {
    blocTest('emit [UserLoading, UserLoaded]',
        build: () => userBloc,
        act: (bloc) => bloc.add(const FetchUser()),
        expect: (() => [
              UserLoading(),
              UserLoaded(user: [User()])
            ]));

    tearDown(() {
      userBloc.close();
    });
  });
}

class MocUserRepo implements UserRepository {
  @override
  Future<List<User>> getUserMoc() {
    // TODO: implement getUserMoc
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getuser() {
    // TODO: implement getuser
    throw UnimplementedError();
  }

  @override
  // TODO: implement userApiClient
  UserApiClient get userApiClient => throw UnimplementedError();
}
