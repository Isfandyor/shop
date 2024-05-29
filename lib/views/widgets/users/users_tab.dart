import 'package:flutter/material.dart';
import 'package:shop/controllers/users.controller.dart';
import 'package:shop/views/widgets/users/users_item.dart';

class UsersTab extends StatelessWidget {
  UsersTab({super.key});
  final usersController = UsersController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: usersController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Foydalanuvchilar mavjud emas"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final users = snapshot.data;
          if (users == null || users.isEmpty) {
            return const Center(child: Text("Foydalanuvchilar mavjud emas"));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (ctx, index) {
                      return UsersItem(
                        id: users[index].id,
                        email: users[index].email,
                        name: users[index].name,
                        avatar: users[index].avatar,
                        role: users[index].role,
                      );
                    }),
              )
            ],
          );
        });
  }
}
