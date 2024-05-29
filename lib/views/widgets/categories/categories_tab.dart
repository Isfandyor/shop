import 'package:flutter/material.dart';
import 'package:shop/controllers/categories_controller.dart';
import 'package:shop/views/widgets/categories/categories_item.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key});
  final categoriesController = CategoriesController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categoriesController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Kategoriya mavjud emas"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final categories = snapshot.data;
          if (categories == null || categories.isEmpty) {
            return const Center(child: Text("Kategoriyalar mavjud emas"));
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            mainAxisExtent: 225,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 5,
                            childAspectRatio: 3 / 2),
                    itemBuilder: (ctx, index) {
                      print(categories[index].image);
                      return CategoriesItem(
                          name: categories[index].name.isEmpty
                              ? "clothes"
                              : categories[index].name,
                          image: categories[index].image);
                    }),
              )
            ],
          );
        });
  }
}
