import 'package:bloc_class/bloc/user_bloc.dart/user_bloc.dart';
import 'package:bloc_class/bloc/user_bloc.dart/user_event.dart';
import 'package:bloc_class/bloc/user_bloc.dart/user_states.dart';
import 'package:bloc_class/core/repository/product_repo.dart';
import 'package:bloc_class/core/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  final UserRepository userRepository;

  const ProductPage({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = UserBloc(userRepository: widget.userRepository);
    _userBloc.add(const FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter user'),
        actions: const <Widget>[],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _userBloc,
          builder: (_, UserState state) {
            //
            if (state is UserEmpty) {
              return const Center(child: Text('Empty state'));
            }

            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.user.length,
                itemBuilder: (context, index) {
                  var product = state.user[index];
                  return Card(
                    color: Colors.lightBlue[100],
                    child: Container(
                      child: Column(
                        children: [
                          // Container(
                          //   child: Image.network(
                          //     product.thumbnail!,
                          //     fit: BoxFit.contain,
                          //   ),
                          // ),
                          // FittedBox(
                          //   fit: BoxFit.fill,
                          //   child: Image.network(
                          //     product.thumbnail!,
                          //   ),
                          // ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       product.title,
                          //       style: const TextStyle(
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text('${product.price} USD'),
                          //         const SizedBox(width: 5),
                          //         IconButton(
                          //           onPressed: () {
                          //             // openModal(context, product);
                          //           },
                          //           icon:
                          //               const Icon(Icons.remove_red_eye_sharp),
                          //         )
                          //       ],
                          //     )
                          //   ],
                          // ),

                          // const SizedBox(height: 6),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Text(product.description!),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            if (state is UserError) {
              return const Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userBloc.close();
    super.dispose();
  }
}

class Location extends StatelessWidget {
  final String location;

  const Location({required Key key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class LastUpdated extends StatelessWidget {
  final DateTime dateTime;

  const LastUpdated({required Key key, required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Updated: ${TimeOfDay.fromDateTime(dateTime).format(context)}',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w200,
        color: Colors.white,
      ),
    );
  }
}
