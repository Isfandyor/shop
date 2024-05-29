import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/models/product.dart';

class ProductsHttpService {
  Future<List<Product>> getProductsHttpServiceFromSever() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Product> loadedProdcuts = [];
    if (data != null) {
      List<Map<String, dynamic>> mapData = data.cast<Map<String, dynamic>>();
      for (var value in mapData) {
        loadedProdcuts.add(Product.fromJson(value));
      }
    }
    return loadedProdcuts;
  }
}
