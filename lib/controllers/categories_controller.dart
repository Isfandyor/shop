import 'package:shop/models/category.dart';
import 'package:shop/services/categories_http_service.dart';

class CategoriesController {
  var categoriesHttpService = CategoriesHttpService();
  Future<List<Categorie>> getCategories() async {
    List<Categorie> categories =
        await categoriesHttpService.getCategoriesFromSever();
    return categories;
  }
}
