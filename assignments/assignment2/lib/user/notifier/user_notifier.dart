import 'package:assignment2/core/api.dart';
import 'package:assignment2/user/states/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final clientProvider = Provider<ApiClient>(
  (_) => ApiClient(
    http.Client(),
  ),
);

//dependent sources
final userStateNotifierProvider = StateNotifierProvider(
  (ref) => UserStateNotifier(
    ref.watch(clientProvider),
  ),
);

class UserStateNotifier extends StateNotifier<UserState> {
  final ApiClient apiClient;
  UserStateNotifier(this.apiClient) : super(const UserState.initial());

  getUser() async {
    try {
      state = const UserState.loading();
      var data = await apiClient.getUser();
      return state = UserState.success(data);
    } catch (e) {
      return state = UserState.error("$e");
    }
  }
}
