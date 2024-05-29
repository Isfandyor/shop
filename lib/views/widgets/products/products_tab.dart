import 'package:flutter/material.dart';
import 'package:shop/controllers/products_controller.dart';
import 'package:shop/views/widgets/products/products_item.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});
  final productsController = ProductsController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: productsController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Mahsulot mavjud emas"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final products = snapshot.data;
          if (products == null || products.isEmpty) {
            return const Center(child: Text("Mahsulotlar mavjud emas"));
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            mainAxisExtent: 300,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 5,
                            childAspectRatio: 3 / 2),
                    itemBuilder: (ctx, index) {
                      return ProductsItem(
                        id: products[index].id,
                        title: products[index].title,
                        images: products[index].images,
                        description: products[index].description,
                        price: products[index].price,
                      );
                    }),
              )
            ],
          );
        });
  }
}
