import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/models/category.dart';

class CategoriesHttpService {
  Future<List<Categorie>> getCategoriesFromSever() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Categorie> loadedCategories = [];
    if (data != null) {
      List<Map<String, dynamic>> mapData = data.cast<Map<String, dynamic>>();
      for (var value in mapData) {
        loadedCategories.add(Categorie.fromJson(value));
      }
    }
    return loadedCategories;
  }
}
