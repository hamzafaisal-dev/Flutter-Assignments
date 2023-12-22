import 'package:assignment2/screens/dummy_screen.dart';
import 'package:assignment2/user/notifier/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/all.dart';
// import 'package:flutter_riverpod_projects/api/pages/map_page.dart';
// import 'package:flutter_riverpod_projects/api/states/api_state/api_state.dart';

class ApiPage extends ConsumerStatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends ConsumerState<ApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          final state = ref.watch(userStateNotifierProvider);
          print(state);
          // return const Center(child: Text('Hrllo'));

          Widget content = Center(
            child: ElevatedButton(
              // color: Colors.blue,
              child: const Text(
                "Get Single User",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                ref.read(userStateNotifierProvider.notifier).getUser();
              },
            ),
          );

          return content;
          // return state.maybeWhen(
          //   loading: () => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          //   success: (user) => Center(
          //     child: Text("${user.email}"),
          //   ),
          //   error: (e) => Center(
          //     child: Text("Error occurred, $e"),
          //   ),
          //   orElse: () => Center(
          //     child: ElevatedButton(
          //       // color: Colors.blue,
          //       child: const Text(
          //         "Get Single User",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       onPressed: () {
          //         ref.read(userStateNotifierProvider.notifier).getUser();
          //       },
          //     ),
          //   ),
          // );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.map),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DummyScreen(),
          ),
        ),
      ),
    );
  }
}
