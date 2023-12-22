import 'package:final_exam/blocs/friend/friend_bloc.dart';
import 'package:final_exam/models/friends_model.dart';
import 'package:final_exam/screens/add_screen.dart';
import 'package:final_exam/widgets/friend_tile.dart';
import 'package:final_exam/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _handleDelete(FriendModel friendToDelete) {
    BlocProvider.of<FriendBloc>(context).add(
      DeleteFriendEvent(newFriend: friendToDelete),
    );
  }

  @override
  void initState() {
    BlocProvider.of<FriendBloc>(context).add(FetchFriendsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: true,
      ),
      body: BlocConsumer<FriendBloc, FriendState>(
        listener: (context, state) {
          if (state is FriendSuccess) {
            BlocProvider.of<FriendBloc>(context).add(FetchFriendsEvent());
          }
        },
        builder: (context, state) {
          print('state is $state');

          if (state is FriendLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FriendsLoaded) {
            return StreamBuilder<List<FriendModel>>(
              stream: state.friends,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<FriendModel>? friends = snapshot.data;

                  return CustomList(friendsList: friends);
                  // return ListView.builder(
                  //   itemCount: friends?.length ?? 0,
                  //   itemBuilder: (context, index) {
                  //     FriendModel friendData = friends![index];

                  //     return FriendTile(
                  //       friend: friendData,
                  //       onDelete: () {
                  //         _handleDelete(friendData);
                  //       },
                  //     );
                  //   },
                  // );
                }
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
