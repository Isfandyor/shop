import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/models/users.dart';

class UsersHttpService {
  Future<List<Users>> getUsersFromService() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Users> loadedUsers = [];
    if (data != null) {
      List<Map<String, dynamic>> mapData = data.cast<Map<String, dynamic>>();
      for (var value in mapData) {
        loadedUsers.add(Users.fromJson(value));
      }
    }
    return loadedUsers;
  }
}
