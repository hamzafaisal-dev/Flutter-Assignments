import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/blocs/auth/auth_bloc.dart';
import 'package:final_exam/blocs/friend/friend_bloc.dart';
import 'package:final_exam/blocs/sign_in/sign_in_bloc.dart';
import 'package:final_exam/blocs/sign_up/sign_up_bloc.dart';
import 'package:final_exam/core/auth/auth_network.dart';
import 'package:final_exam/core/auth/auth_repository.dart';
import 'package:final_exam/core/friends/friends_network.dart';
import 'package:final_exam/core/friends/friends_repository.dart';
import 'package:final_exam/firebase_options.dart';
import 'package:final_exam/screens/login_screen.dart';
import 'package:final_exam/screens/transactions_screen.dart';
import 'package:final_exam/screens/ui_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final AuthRepository authRepository = AuthRepository(
    userFirebaseClient: UserFirebaseClient(
      firebaseAuth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
  );

  final FriendsRepository friendsRepository = FriendsRepository(
    friendsFirebaseClient: FriendsFirebaseClient(
      firebaseAuth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
  );

  runApp(
    MyApp(authRepository: authRepository, friendsRepository: friendsRepository),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.authRepository,
    required this.friendsRepository,
  });

  final AuthRepository authRepository;
  final FriendsRepository friendsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => FriendBloc(friendsRepository: friendsRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            fillColor: Colors.transparent,
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              ),
            ),
          ),
        ),
        home: const UIScreen(),
      ),
    );
  }
}
