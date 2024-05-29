import 'package:flutter/material.dart';
import 'package:shop/views/widgets/categories/categories_tab.dart';
import 'package:shop/views/widgets/products/products_tab.dart';
import 'package:shop/views/widgets/users/users_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text("Shop"),
          centerTitle: true,
          backgroundColor: Colors.grey.shade200,
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  labelPadding: EdgeInsets.all(12),
                  tabs: [
                    Text("Categories"),
                    Text("Products"),
                    Text("Users"),
                  ]),
              Expanded(
                child: TabBarView(
                  children: [
                    CategoriesTab(),
                    ProductsTab(),
                    UsersTab(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
