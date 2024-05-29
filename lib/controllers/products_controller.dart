import 'package:shop/models/product.dart';
import 'package:shop/services/products_http_service.dart';

class ProductsController {
  var productsHttpService = ProductsHttpService();
  Future<List<Product>> getCategories() async {
    List<Product> products =
        await productsHttpService.getProductsHttpServiceFromSever();
    return products;
  }
}
