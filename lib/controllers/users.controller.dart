import 'package:shop/models/users.dart';
import 'package:shop/services/users_http_service.dart';

class UsersController {
  var usersHttpService = UsersHttpService();
  Future<List<Users>> getCategories() async {
    List<Users> users = await usersHttpService.getUsersFromService();
    return users;
  }
}
