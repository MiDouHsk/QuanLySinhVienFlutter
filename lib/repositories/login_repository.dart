import 'package:quanlysinhvien/model/profile.dart';
import 'package:quanlysinhvien/services/api_service.dart';

class LoginRepository {
  final ApiService api = ApiService();
  Future<Profile> login(String username, String password) async {
    Profile profile = Profile();
    final response = await api.loginUser(username, password);
    if (response != null && response.statusCode == 200) {
      profile.token = response.data['token'];
      profile.SetUsernamePassword(username, password);
    } else {
      profile.token = "";
    }
    return profile;
  }
}
