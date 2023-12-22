import 'package:final_exam/blocs/friend/friend_bloc.dart';
import 'package:final_exam/constants.dart';
import 'package:final_exam/models/friends_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, this.friend});

  final FriendModel? friend;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();

  void _handleAdd() {
    if (_formKey.currentState!.validate()) {
      // handle adding logic

      FriendModel newFriend = FriendModel(
        friendId: '${_nameController.text}-${DateTime.now()}',
        name: _nameController.text,
        email: _emailController.text,
        contactNumber: _mobileController.text,
        profileAvatar:
            "https://yt3.googleusercontent.com/-CFTJHU7fEWb7BYEb6Jh9gm1EpetvVGQqtof0Rbh-VQRIznYYKJxCaqv_9HeBcmJmIsp2vOO9JU=s900-c-k-c0x00ffffff-no-rj",
        createdTime: DateTime.now(),
      );

      BlocProvider.of<FriendBloc>(context)
          .add(AddFriendEvent(newFriend: newFriend));
    }
  }

  void _handleEdit() {
    if (widget.friend != null) {
      FriendModel updatedFriend = widget.friend!.copyWith(
        name: _nameController.text,
        email: _emailController.text,
        contactNumber: _mobileController.text,
      );

      BlocProvider.of<FriendBloc>(context)
          .add(UpdateFriendEvent(newFriend: updatedFriend));
    }
  }

  @override
  void initState() {
    if (widget.friend != null) {
      _nameController.text = widget.friend?.name ?? '';
      _emailController.text = widget.friend?.email ?? '';
      _mobileController.text = widget.friend?.contactNumber ?? '';
    }

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool whichAction = (widget.friend != null);

    return Scaffold(
      appBar: AppBar(
        title: whichAction ? const Text('Edit') : const Text('Add'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: BlocConsumer<FriendBloc, FriendState>(
                listener: (context, state) {
                  if (state is FriendSuccess) {
                    print('Friend successfully added');

                    _nameController.clear();
                    _emailController.clear();
                    _mobileController.clear();
                  }

                  if (state is FriendError) print(state.errorMessage);
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      //
                      const SizedBox(height: 38),

                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || !value.isValidName()) {
                            return 'Name mein masla';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 28),

                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || !value.isValidEmail()) {
                            return 'Email mein masla';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 28),

                      TextFormField(
                        controller: _mobileController,
                        decoration: const InputDecoration(
                          labelText: 'Mobile No.',
                        ),
                        validator: (value) {
                          if (value == null || !value.isValidPhone()) {
                            return 'Phone mein masla';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 28),

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FilledButton(
                          onPressed: whichAction ? _handleEdit : _handleAdd,
                          child: (state is FriendLoading)
                              ? const CircularProgressIndicator()
                              : (whichAction
                                  ? const Text('EDIT')
                                  : const Text('ADD')),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
